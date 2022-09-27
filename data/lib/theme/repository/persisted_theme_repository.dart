import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ThemeKey {
  static const isColorThemeSetUp = 'key.is_color_theme_set_up';
  static const isTypographyThemeSetUp = 'key.is_typography_theme_set_up';
  static const colorThemeMode = 'key.color_theme_mode';
  static const typographyThemeMode = 'key.typography_theme_mode';
}

class PersistedThemeRepository extends ThemeRepository {
  final SharedPreferences preferences;

  PersistedThemeRepository(this.preferences);

  @override
  bool getIsColorThemeSetUp() {
    return preferences.getBool(_ThemeKey.isColorThemeSetUp) ?? false;
  }

  @override
  bool getIsTypographyThemeSetUp() {
    return preferences.getBool(_ThemeKey.isTypographyThemeSetUp) ?? false;
  }

  @override
  AppColorThemeMode getColorThemeMode() {
    final index = preferences.getInt(_ThemeKey.colorThemeMode) ?? 0;
    final mode = AppColorThemeMode.values[index];
    return mode;
  }

  @override
  AppTypographyThemeMode getTypographyThemeMode() {
    final index = preferences.getInt(_ThemeKey.typographyThemeMode) ?? 0;
    final mode = AppTypographyThemeMode.values[index];
    return mode;
  }

  @override
  Future<void> setColorThemeMode(AppColorThemeMode mode) async {
    await preferences.setBool(_ThemeKey.isColorThemeSetUp, true);
    await preferences.setInt(_ThemeKey.colorThemeMode, mode.index);
  }

  @override
  Future<void> setTypographyThemeMode(AppTypographyThemeMode mode) async {
    await preferences.setBool(_ThemeKey.isTypographyThemeSetUp, true);
    await preferences.setInt(_ThemeKey.typographyThemeMode, mode.index);
  }
}
