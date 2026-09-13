import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:reachu_driver/l10n/app_localizations.dart';
import 'core/localization/locale_provider.dart';
import 'app/theme/app_theme.dart';
import 'app/theme/app_theme_provider.dart';
import 'app/router/app_router.dart';
import 'features/home/ui/force_update_guard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/socket/app_lifecycle_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appLifecycleProvider);
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);

    final app = ScreenUtilInit(
      designSize: const Size(390, 844), // Standard modern phone size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Reachu',
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: router,
          builder: (context, child) =>
              ForceUpdateAndMaintenanceGuard(child: child!),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
        );
      },
    );

    return kDebugMode ? FlavorBanner(child: app) : app;
  }
}
