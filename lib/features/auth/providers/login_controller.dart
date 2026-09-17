import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reachu_driver/features/auth/providers/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../models/auth_models.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/network/result.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/app_snackbar.dart';
// import 'package:sms_autofill/sms_autofill.dart';

part 'login_controller.g.dart';

class LoginState {
  final bool isLoading;
  final bool otpSent;
  final String enteredOtp;
  final int resendCountdown;
  final bool termsAccepted;
  final bool tdsAccepted;
  final String phone;
  final String userId;
  final int otpTriggerCount;

  const LoginState({
    this.isLoading = false,
    this.otpSent = false,
    this.enteredOtp = '',
    this.resendCountdown = 0,
    this.termsAccepted = false,
    this.tdsAccepted = false,
    this.phone = '',
    this.userId = '',
    this.otpTriggerCount = 0,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? otpSent,
    String? enteredOtp,
    int? resendCountdown,
    bool? termsAccepted,
    bool? tdsAccepted,
    String? phone,
    String? userId,
    int? otpTriggerCount,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      otpSent: otpSent ?? this.otpSent,
      enteredOtp: enteredOtp ?? this.enteredOtp,
      resendCountdown: resendCountdown ?? this.resendCountdown,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      tdsAccepted: tdsAccepted ?? this.tdsAccepted,
      phone: phone ?? this.phone,
      userId: userId ?? this.userId,
      otpTriggerCount: otpTriggerCount ?? this.otpTriggerCount,
    );
  }
}

@Riverpod(keepAlive: true)
class LoginController extends _$LoginController {
  Timer? _resendTimer;
  StreamSubscription? _smsSubscription;

  @override
  LoginState build() {
    ref.onDispose(() {
      _resendTimer?.cancel();
      _smsSubscription?.cancel();
    });

    _smsSubscription = SmsAutoFill().code.listen((code) {
      AppLogger.i('LoginController: SMS Code received globally: "$code"');
      if (code.isNotEmpty) {
        state = state.copyWith(enteredOtp: code);
      }
    });

    return const LoginState();
  }

  void setTermsAccepted(bool accepted) {
    state = state.copyWith(termsAccepted: accepted);
  }

  void setTdsAccepted(bool accepted) {
    state = state.copyWith(tdsAccepted: accepted);
  }

  void setOtp(String otp) {
    state = state.copyWith(enteredOtp: otp);
  }

  Future<String?> sendOtp(String phone) async {
    AppLogger.i('Initiating OTP request for phone: $phone');
    state = state.copyWith(
      isLoading: true,
      phone: phone,
      enteredOtp: '', // Clear old OTP on new request
    );

    // Call listenForCode before calling the sendOtp API to prevent race conditions
    AppLogger.i(
      'LoginController: Registering SMS Retriever listener (sendOtp)',
    );
    await SmsAutoFill().listenForCode();

    final repository = ref.read(authRepositoryProvider);
    final appSignature = await SmsAutoFill().getAppSignature;
    AppLogger.i('App Signature: $appSignature');
    final result = await repository.sendOtp(
      LoginRequest(phone: phone, appSignature: appSignature),
    );

    String? errorMsg;
    switch (result) {
      case Success(:final data):
        if (data.success) {
          AppLogger.d(
            'OTP successfully sent to $phone. Message: ${data.message}',
          );
          state = state.copyWith(
            isLoading: false,
            otpSent: true,
            otpTriggerCount: state.otpTriggerCount + 1,
          );
          _startResendTimer();
        } else {
          state = state.copyWith(isLoading: false);
          AppLogger.w(
            'OTP request returned success: false. Message: ${data.message}',
          );
          errorMsg = data.message;
        }
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        final errorMessage = NetworkExceptions.getErrorMessage(error);
        AppLogger.e('Send OTP Network Failure: $errorMessage');
        errorMsg = errorMessage;
    }
    return errorMsg;
  }

  Future<(bool success, String? error, String overallStatus)> verifyOtp() async {
    if (state.phone.isEmpty || state.enteredOtp.isEmpty) {
      AppLogger.w('Cannot verify OTP: Phone or OTP is empty');
      return (false, 'Phone or OTP is empty', 'not_started');
    }

    AppLogger.i('Verifying OTP for phone: ${state.phone}');
    state = state.copyWith(isLoading: true);

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.verifyOtp(
      VerifyOtpRequest(phone: state.phone, otp: state.enteredOtp),
    );

    String? errorMsg;
    String overallStatus = 'not_started';
    bool success = false;

    switch (result) {
      case Success(:final data):
        if (data.success) {
          AppLogger.d(
            'OTP verification successful. Token present: ${data.token != null}',
          );
          state = state.copyWith(isLoading: false, userId: data.user?.id ?? '');

          if (data.token != null && data.token!.isNotEmpty) {
            const secureStorage = FlutterSecureStorage();
            await secureStorage.write(key: 'driver_phone', value: state.phone);
            await repository.saveTokens(data.token!, data.refreshToken ?? '');

            // Query the latest registration status
            final statusResult = await repository.getRegistrationStatus();
            switch (statusResult) {
              case Success(data: final sData):
                if (sData.success && sData.data != null) {
                  overallStatus = sData.data!.overallStatus;
                  final cityId = sData.data!.personalInfo?.cityId ??
                      sData.data!.personalInfo?.homeCityId;
                  if (cityId != null && cityId.trim().isNotEmpty) {
                    await secureStorage.write(
                      key: 'driver_city_id',
                      value: cityId.trim(),
                    );
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('city_id', cityId.trim());
                  }
                }
              case Failure():
                break;
            }

            if (overallStatus == 'approved') {
              await secureStorage.write(key: 'profile_complete', value: 'true');
              await secureStorage.write(key: 'verification_status', value: 'verified');
              await ref.read(authProvider.notifier).setAuthenticated();
            } else if (overallStatus == 'action_required' || overallStatus == 'pending_review') {
              await secureStorage.write(key: 'profile_complete', value: 'true');
              await secureStorage.write(key: 'verification_status', value: overallStatus);
              await ref.read(authProvider.notifier).setPendingVerification();
            } else {
              await secureStorage.write(key: 'profile_complete', value: 'false');
              await secureStorage.write(key: 'verification_status', value: overallStatus);
              await ref.read(authProvider.notifier).setIncomplete();
            }
            success = true;
          } else {
            errorMsg = 'OTP verified but no token was provided in response.';
            AppLogger.w(errorMsg);
          }
        } else {
          state = state.copyWith(isLoading: false);
          AppLogger.w(
            'OTP verification returned success: false. Message: ${data.message}',
          );
          errorMsg = data.message;
        }
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        final errorMessage = NetworkExceptions.getErrorMessage(error);
        AppLogger.e('Verify OTP Network Failure: $errorMessage');
        errorMsg = errorMessage;
    }

    return (success, errorMsg, overallStatus);
  }

  Future<String?> resendOtp(String phone) async {
    if (state.resendCountdown > 0) return null;

    state = state.copyWith(
      isLoading: true,
      phone: phone,
      enteredOtp: '', // Clear old OTP
    );

    // Call listenForCode before calling the sendOtp API to prevent race conditions
    AppLogger.i(
      'LoginController: Registering SMS Retriever listener (resendOtp)',
    );
    await SmsAutoFill().listenForCode();

    final repository = ref.read(authRepositoryProvider);
    final appSignature = await SmsAutoFill().getAppSignature;
    final result = await repository.sendOtp(
      LoginRequest(phone: phone, appSignature: appSignature),
    );

    String? errorMsg;

    switch (result) {
      case Success(:final data):
        if (data.success) {
          state = state.copyWith(
            isLoading: false,
            otpTriggerCount: state.otpTriggerCount + 1,
          );
          _startResendTimer();
        } else {
          state = state.copyWith(isLoading: false);
          errorMsg = data.message;
        }
      case Failure(:final error):
        state = state.copyWith(isLoading: false);
        final errorMessage = NetworkExceptions.getErrorMessage(error);
        AppLogger.e('Resend OTP Failed: $errorMessage');
        errorMsg = errorMessage;
    }

    return errorMsg;
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    state = state.copyWith(resendCountdown: 30);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown <= 0) {
        timer.cancel();
        return;
      }
      state = state.copyWith(resendCountdown: state.resendCountdown - 1);
    });
  }

  void goBackToPhone() {
    _resendTimer?.cancel();
    state = state.copyWith(
      otpSent: false,
      enteredOtp: '',
      resendCountdown: 0,
      isLoading: false,
    );
  }

  void resetState() {
    _resendTimer?.cancel();
    state = const LoginState();
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    final repository = ref.read(authRepositoryProvider);

    // Attempt backend logout
    try {
      final result = await repository.logout();
      switch (result) {
        case Success(:final data):
          if (data.success) {
            AppSnackbar.showSuccess(message: data.message);
          }
        case Failure(:final error):
          AppLogger.e(
            'Logout backend error: ${NetworkExceptions.getErrorMessage(error)}',
          );
      }
    } catch (e) {
      AppLogger.e('Logout exception: $e');
    }

    // AuthNotifier handles clearing tokens, sockets, cache, and routing
    await ref.read(authProvider.notifier).logout();

    // Clear state
    resetState();
  }
}
