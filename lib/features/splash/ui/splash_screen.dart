import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/providers/auth_state_provider.dart';
import '../../account/providers/company_controller.dart';
import '../../tutorials/providers/tutorial_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _navigated = false;
  bool _timerCompleted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Pre-fetch company details / CDN bucket URL in the background
    ref.read(companyControllerProvider);

    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _timerCompleted = true;
        });
        _attemptNavigation();
      }
    });
  }

  Future<void> _attemptNavigation() async {
    if (!mounted || _navigated) return;

    final authStatus = ref.read(authProvider);

    if (authStatus != AuthStatus.initial && _timerCompleted) {
      _navigated = true;
      switch (authStatus) {
        case AuthStatus.authenticated:
          try {
            final isPending = await ref
                .read(pendingTutorialsProvider.notifier)
                .checkPendingStatus();
            if (!mounted) return;
            if (isPending) {
              context.go('/mandatory_tutorials');
              return;
            }
          } catch (_) {}
          if (mounted) {
            context.go('/home');
          }
          break;
        case AuthStatus.unauthenticated:
          context.go('/login');
          break;
        case AuthStatus.incomplete:
          context.go('/onboarding');
          break;
        case AuthStatus.pendingVerification:
          context.go('/verification');
          break;
        case AuthStatus.initial:
          break;
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to authentication status changes
    ref.listen<AuthStatus>(authProvider, (previous, next) {
      if (next != AuthStatus.initial) {
        _attemptNavigation();
      }
    });

    // Attempt navigation in case both states are already resolved
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _attemptNavigation();
    });

    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 38, 89, 1),
      body: SizedBox.expand(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
