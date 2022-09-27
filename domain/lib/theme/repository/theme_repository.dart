import 'package:domain/theme/model/app_theme_mode.dart';

abstract class ThemeRepository {
  bool getIsColorThemeSetUp();

  bool getIsTypographyThemeSetUp();

  AppColorThemeMode getColorThemeMode();

  AppTypographyThemeMode getTypographyThemeMode();

  Future<void> setColorThemeMode(AppColorThemeMode mode);

  Future<void> setTypographyThemeMode(AppTypographyThemeMode mode);
}
