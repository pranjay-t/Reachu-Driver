import 'package:reachu_driver/app/router/scaffold_with_nav_bar.dart';
import 'package:reachu_driver/features/splash/ui/splash_screen.dart';
import 'package:reachu_driver/features/auth/ui/screens/login_screen.dart';
import 'package:reachu_driver/features/auth/ui/screens/onboarding_stepper_screen.dart';
import 'package:reachu_driver/features/auth/ui/screens/verification_status_screen.dart';
import 'package:reachu_driver/features/home/ui/home_screen.dart';
import 'package:reachu_driver/features/booking/ui/booking_screen.dart';
import 'package:reachu_driver/features/booking/ui/ride_request_queue_screen.dart';
import 'package:reachu_driver/features/booking/ui/arriving_client_screen.dart';
import 'package:reachu_driver/features/booking/ui/ride_chat_screen.dart';
import 'package:reachu_driver/features/booking/ui/ride_otp_verification_screen.dart';
import 'package:reachu_driver/features/booking/ui/ride_details_screen.dart';
import 'package:reachu_driver/features/booking/ui/ride_payment_screen.dart';
import 'package:reachu_driver/features/earning/ui/earning_screen.dart';
import 'package:reachu_driver/features/support/ui/support_screen.dart';
import 'package:reachu_driver/features/support/ui/faqs_screen.dart';
import 'package:reachu_driver/features/support/ui/raise_ticket_screen.dart';
import 'package:reachu_driver/features/support/ui/tickets_screen.dart';
import 'package:reachu_driver/features/support/ui/ticket_chat_screen.dart';
import 'package:reachu_driver/features/payment/ui/payment_screen.dart';
import 'package:reachu_driver/features/payment/ui/add_money_screen.dart';
import 'package:reachu_driver/features/payment/ui/transactions_screen.dart';
import 'package:reachu_driver/features/payment/ui/bank_accounts_screen.dart';
import 'package:reachu_driver/features/payment/ui/add_edit_bank_account_screen.dart';
import 'package:reachu_driver/features/payment/ui/money_transfer_screen.dart';
import 'package:reachu_driver/features/account/ui/profile_screen.dart';
import 'package:reachu_driver/features/account/ui/edit_profile_screen.dart';
import 'package:reachu_driver/features/account/ui/camera_preview_screen.dart';
import 'package:reachu_driver/features/account/ui/company_info_screen.dart';
import 'package:reachu_driver/features/account/ui/rating_screen.dart';
import 'package:reachu_driver/features/account/ui/language_selection_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:reachu_driver/features/auth/providers/auth_state_provider.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

@riverpod
GoRouter appRouter(Ref ref) {
  final listenable = ValueNotifier<AuthStatus>(AuthStatus.initial);

  ref.listen<AuthStatus>(authProvider, (previous, next) {
    listenable.value = next;
  });

  listenable.value = ref.read(authProvider);

  ref.onDispose(() {
    listenable.dispose();
  });

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: listenable,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    redirect: (context, state) {
      final authStatus = listenable.value;
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToSplash = state.matchedLocation == '/splash';
      final isGoingToOnboarding = state.matchedLocation.startsWith(
        '/onboarding',
      );
      final isGoingToVerification = state.matchedLocation.startsWith(
        '/verification',
      );
      final isGoingToCameraPreview = state.matchedLocation.contains(
        'camera_preview',
      );
      final isGoingToPrivacyPolicy = state.matchedLocation == '/privacy_policy';
      final isGoingToTermsConditions =
          state.matchedLocation == '/terms_conditions';

      // While initializing, keep them on the splash screen
      if (authStatus == AuthStatus.initial) {
        return isGoingToSplash ? null : '/splash';
      }

      // If they are not logged in and trying to go to a protected route
      if (authStatus == AuthStatus.unauthenticated &&
          !isGoingToLogin &&
          !isGoingToSplash &&
          !isGoingToPrivacyPolicy &&
          !isGoingToTermsConditions) {
        return '/login';
      }

      // If they are logged in but haven't completed their onboarding details
      if (authStatus == AuthStatus.incomplete &&
          !isGoingToOnboarding &&
          !isGoingToCameraPreview &&
          !isGoingToSplash &&
          !isGoingToPrivacyPolicy &&
          !isGoingToTermsConditions) {
        return '/onboarding';
      }

      // If they completed onboarding but are pending verification
      if (authStatus == AuthStatus.pendingVerification &&
          !isGoingToVerification &&
          !isGoingToCameraPreview &&
          !isGoingToSplash &&
          !isGoingToPrivacyPolicy &&
          !isGoingToTermsConditions) {
        return '/verification';
      }

      // If they ARE fully verified and logged in, but trying to hit login, onboarding or verification
      if (authStatus == AuthStatus.authenticated &&
          (isGoingToLogin || isGoingToOnboarding || isGoingToVerification)) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/privacy_policy',
        name: 'privacy_policy',
        builder: (context, state) => const CompanyInfoScreen(type: 'privacy'),
      ),
      GoRoute(
        path: '/terms_conditions',
        name: 'terms_conditions',
        builder: (context, state) => const CompanyInfoScreen(type: 'terms'),
      ),
      GoRoute(
        path: '/ride_request_queue',
        name: 'ride_request_queue',
        builder: (context, state) => const RideRequestQueueScreen(),
      ),
      GoRoute(
        path: '/arriving_client',
        name: 'arriving_client',
        builder: (context, state) {
          final rideData = state.extra as Map<String, dynamic>?;
          return ArrivingClientScreen(rideData: rideData);
        },
      ),
      GoRoute(
        path: '/ride_chat',
        name: 'ride_chat',
        builder: (context, state) {
          final rideData = state.extra as Map<String, dynamic>?;
          return RideChatScreen(rideData: rideData);
        },
      ),
      GoRoute(
        path: '/ride_otp',
        name: 'ride_otp',
        builder: (context, state) {
          final rideData = state.extra as Map<String, dynamic>?;
          return RideOtpVerificationScreen(rideData: rideData);
        },
      ),
      GoRoute(
        path: '/ride_details',
        name: 'ride_details',
        builder: (context, state) {
          final ride = state.extra as Map<String, dynamic>? ?? {};
          return RideDetailsScreen(ride: ride);
        },
      ),
      GoRoute(
        path: '/ride_payment',
        name: 'ride_payment',
        builder: (context, state) {
          final rideData = state.extra as Map<String, dynamic>?;
          return RidePaymentScreen(rideData: rideData);
        },
      ),
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) {
          final phoneNumber = state.uri.queryParameters['phone'] ?? '';
          return OnboardingStepperScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: '/verification',
        name: 'verification',
        builder: (context, state) => const VerificationStatusScreen(),
      ),

      GoRoute(
        path: '/payment',
        name: 'payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/add_money',
        name: 'add_money',
        builder: (context, state) => const AddMoneyScreen(),
      ),
      GoRoute(
        path: '/transactions',
        name: 'transactions',
        builder: (context, state) => const TransactionsScreen(),
      ),
      GoRoute(
        path: '/bank_accounts',
        name: 'bank_accounts',
        builder: (context, state) => const BankAccountsScreen(),
      ),
      GoRoute(
        path: '/add_edit_bank_account',
        name: 'add_edit_bank_account',
        builder: (context, state) {
          final accountId = state.uri.queryParameters['accountId'];
          return AddEditBankAccountScreen(accountId: accountId);
        },
      ),
      GoRoute(
        path: '/money_transfer',
        name: 'money_transfer',
        builder: (context, state) => const MoneyTransferScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/booking',
                name: 'booking',
                builder: (context, state) => const BookingScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/earning',
                name: 'earning',
                builder: (context, state) => const EarningScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/support',
                name: 'support',
                builder: (context, state) => const SupportScreen(),
                routes: [
                  GoRoute(
                    path: 'faqs',
                    name: 'faqs',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const FaqsScreen(),
                  ),
                  GoRoute(
                    path: 'raise_ticket',
                    name: 'raise_ticket',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RaiseTicketScreen(),
                  ),
                  GoRoute(
                    path: 'tickets',
                    name: 'tickets',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const TicketsScreen(),
                  ),
                  GoRoute(
                    path: 'chat/:ticketId',
                    name: 'ticket_chat',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final ticketId = state.pathParameters['ticketId'] ?? '';
                      return TicketChatScreen(ticketId: ticketId);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'edit_profile',
                    name: 'edit_profile',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const EditProfileScreen(),
                  ),
                  GoRoute(
                    path: 'rating',
                    name: 'rating',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RatingScreen(),
                  ),
                  GoRoute(
                    path: 'language',
                    name: 'language',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const LanguageSelectionScreen(),
                  ),
                  GoRoute(
                    path: 'camera_preview',
                    name: 'camera_preview',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final useFront =
                          state.uri.queryParameters['useFront'] == 'true';
                      return CameraPreviewScreen(useFrontCamera: useFront);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
