import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';

class AppThemeSwitcher extends InheritedWidget {
  final ThemeRepository themeRepository;
  final Function(AppThemeMode) onThemeSwitch;

  const AppThemeSwitcher({
    Key? key,
    required this.themeRepository,
    required this.onThemeSwitch,
    required Widget child,
  }) : super(key: key, child: child);

  static void setColorMode(BuildContext context, AppColorThemeMode colorMode) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppThemeSwitcher>();
    if (result == null) {
      throw 'No AppThemeMode found in context';
    }

    final typographyMode = result.themeRepository.getTypographyThemeMode();
    final appThemeMode = AppThemeMode(
      colorMode: colorMode,
      typographyMode: typographyMode,
    );

    result.themeRepository.setColorThemeMode(colorMode);
    result.onThemeSwitch(appThemeMode);
  }

  static void setTypographyMode(
    BuildContext context,
    AppTypographyThemeMode typographyMode,
  ) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppThemeSwitcher>();
    if (result == null) {
      throw 'No AppThemeMode found in context';
    }

    final colorMode = result.themeRepository.getColorThemeMode();
    final appThemeMode = AppThemeMode(
      colorMode: colorMode,
      typographyMode: typographyMode,
    );

    result.themeRepository.setTypographyThemeMode(typographyMode);
    result.onThemeSwitch(appThemeMode);
  }

  @override
  bool updateShouldNotify(AppThemeSwitcher oldWidget) => oldWidget != this;
}
