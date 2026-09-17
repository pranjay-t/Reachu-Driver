import 'package:flutter_flavor/flutter_flavor.dart';
import 'company_bucket_url.dart';

class ApiEndpoints {
  static String get baseUrl =>
      FlavorConfig.instance.variables["baseUrl"] as String;

  /// Dynamically fetched bucket URL from Company API (backed by persistent cache)
  static String get imagebaseUrl => CompanyBucketUrl.current;

  /// Helper to safely resolve a complete image or file URL from a relative path or full URL
  static String getImageUrl(String? path) => CompanyBucketUrl.getImageUrl(path);

  /// Backwards-compatible alias for getImageUrl
  static String getFullImageUrl(String? path) => CompanyBucketUrl.getImageUrl(path);

  // AUTHENTICATION
  static const String login = '/driver/registerLogin';
  static const String verifyOtp = '/driver/verifyOtp';
  static const String userExist = '/isUserExist?phone=<phone>';
  static const String refreshToken = '/auth/refreshToken';
  static const String logout = '/auth/logout';
  static const String getActiveCities = '/getActiveCities';

  // DRIVER ONBOARDING & DASHBOARD
  static const String getAllVehicleCategories = '/getAllVehicleCategories';
  static const String getAllVehicleSubCategories =
      '/getAllVehicleSubCategories';
  static const String createVehicle = '/createVehicle';
  static const String driverRegister = '/driver/register';
  static const String driverUpdate = '/driver/update';
  static const String driverRegistrationStatus = '/driver/registration/status';
  static String driverRegistrationResubmit(String stepId) =>
      '/driver/registration/steps/$stepId/resubmit';
  static const String driverStepPersonalInfo =
      '/driver/registration/steps/personal_info';
  static const String driverStepProfilePhoto =
      '/driver/registration/steps/profile_photo';
  static const String driverStepDrivingLicense =
      '/driver/registration/steps/driving_license';
  static const String driverStepAadhar =
      '/driver/registration/steps/aadhar';
  static const String driverStepPan =
      '/driver/registration/steps/pan';
  static const String driverStepVehicleDetails =
      '/driver/registration/steps/vehicle_details';
  static const String driverHome = '/driver/home';
  static const String toggleDuty = '/driver/toggleDuty/<driverId>';

  // COMPATIBILITY/FALLBACK (DRIVER PROFILE)
  static const String getDriverById = '/driver/getDriverProfile/<driverId>';
  static const String updateUserProfile =
      '/driver/update?userId=<driverId>&userType=Driver';

  // BOOKING / ORDERS
  static const String updateOrder = '/order/update/<orderId>';
  static const String verifyOrderOtp = '/order/verifyOtp';
  static const String verifyStopOtp = '/order/<orderId>/stops/<stopIndex>/verifyOtp';
  static const String verifyDeliveryOtp = '/order/<orderId>/delivery/verifyOtp';
  static const String resendOtp = '/order/<orderId>/otp/resend';
  static String driverHistory = '/order/driver/history';
  static String getCompany = '/company/getCompany';

  // FAQS
  static const String getAllCategories = '/getAllCategories';
  static String getByCategory(String category) =>
      '/getByCategory/${Uri.encodeComponent(category)}';

  // TUTORIALS
  static const String tutorialsPending = '/driver/tutorials/pending';
  static const String driverTutorials = '/driver/tutorials';
  static String watchTutorial(String id) => '/driver/tutorials/$id/watch';
}

class ApiPath {
  static const String getCurrentOrder = '/order/current';
  static const String getWallet = '/wallet';
  static const String getRazorpayOrderId = '/payments/wallet';
  static const String verifyPayment = '/payments/verify';
  static const String getTransactions = '/transactions';
  static const String addBankAccount = '/bank-accounts/add';
  static const String verifyBankAccount = '/bank-accounts/verify';
  static const String withdrawMoney = '/payments/withdraw';
  static const String collectCash = '/payments/cash';

  static String getBankAccounts(String driverId) =>
      '/bank-accounts/driverId/$driverId';
  static String updateBankAccount(String accountId) =>
      '/bank-accounts/update/$accountId';
  static String deleteBankAccount(String accountId) =>
      '/bank-accounts/delete/$accountId';
  static String getRideQr(String orderId) => '/payments/ride/$orderId/qr';
  static String refreshRidePayment(String orderId) =>
      '/payments/ride/$orderId/refresh';

  // RATINGS & REVIEWS
  static const String getDriverRatings = '/rating/getDriver';

  // SUPPORT / FAQS
  static const String getAllCategories = '/getAllCategories';
  static String getByCategory(String category) =>
      '/getByCategory/${Uri.encodeComponent(category)}';
}
