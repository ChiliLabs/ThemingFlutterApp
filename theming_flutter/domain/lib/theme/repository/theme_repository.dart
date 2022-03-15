import 'package:domain/theme/model/app_theme_mode.dart';

abstract class ThemeRepository {
  bool getIsThemeSetUp();

  AppThemeMode getMode();

  Future<void> setThemeMode(AppThemeMode mode);
}
