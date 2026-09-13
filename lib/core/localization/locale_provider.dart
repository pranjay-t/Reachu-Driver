import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reachu_driver/l10n/app_localizations.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const _localeKey = 'app_locale';

  @override
  Locale build() {
    _loadLocale();
    return const Locale('en'); // Default to English
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey);
    if (languageCode != null) {
      state = Locale(languageCode);
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
