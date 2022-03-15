import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ThemeKey {
  static const isThemeSetUp = 'key.is_theme_set_up';
  static const themeMode = 'key.theme_mode';
}

class PersistedThemeRepository extends ThemeRepository {
  final SharedPreferences preferences;

  PersistedThemeRepository(this.preferences);

  @override
  bool getIsThemeSetUp() {
    return preferences.getBool(_ThemeKey.isThemeSetUp) ?? false;
  }

  @override
  AppThemeMode getMode() {
    final index = preferences.getInt(_ThemeKey.themeMode) ?? 0;
    final mode = AppThemeMode.values[index];
    return mode;
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    await preferences.setBool(_ThemeKey.isThemeSetUp, true);
    await preferences.setInt(_ThemeKey.themeMode, mode.index);
  }
}
