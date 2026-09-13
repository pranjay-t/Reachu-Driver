import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

part 'app_theme_provider.g.dart';

// ══════════════════════════════════════════
// THEME MODE PROVIDER
// ══════════════════════════════════════════
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _themeKey = 'app_theme_mode';

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.light; // Default to dark-first
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey);
    if (themeIndex != null) {
      state = ThemeMode.values[themeIndex];
    }
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    state = newMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, newMode.index);
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }
}

// ══════════════════════════════════════════
// ACTIVE THEME DATA PROVIDER
// ══════════════════════════════════════════
@riverpod
ThemeData activeTheme(Ref ref) {
  final themeMode = ref.watch(themeModeProvider);
  
  if (themeMode == ThemeMode.light) {
    return AppTheme.lightTheme;
  }
  return AppTheme.darkTheme; // Fallback and default is dark
}
