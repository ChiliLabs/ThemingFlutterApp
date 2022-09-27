import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData lightPoppinsAppThemeData;
  final AppThemeData lightRobotoAppThemeData;

  final AppThemeData darkPoppinsAppThemeData;
  final AppThemeData darkRobotoAppThemeData;

  final AppThemeData oceanPoppinsAppThemeData;
  final AppThemeData oceanRobotoAppThemeData;

  final AppThemeData draculaPoppinsAppThemeData;
  final AppThemeData draculaRobotoAppThemeData;

  final AppThemeMode appThemeMode;

  const AppTheme({
    Key? key,
    required this.lightPoppinsAppThemeData,
    required this.lightRobotoAppThemeData,
    required this.darkPoppinsAppThemeData,
    required this.darkRobotoAppThemeData,
    required this.oceanPoppinsAppThemeData,
    required this.oceanRobotoAppThemeData,
    required this.draculaPoppinsAppThemeData,
    required this.draculaRobotoAppThemeData,
    required this.appThemeMode,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (result == null) {
      throw 'No AppTheme found in context';
    }

    final colorMode = result.appThemeMode.colorMode;
    final typographyMode = result.appThemeMode.typographyMode;
    final overlayStyle = result.appThemeMode.overlayStyle;

    switch (colorMode) {
      case AppColorThemeMode.light:
        if (typographyMode == AppTypographyThemeMode.poppins) {
          return result.lightPoppinsAppThemeData;
        } else {
          return result.lightRobotoAppThemeData;
        }
      case AppColorThemeMode.dark:
        if (typographyMode == AppTypographyThemeMode.poppins) {
          return result.darkPoppinsAppThemeData;
        } else {
          return result.darkRobotoAppThemeData;
        }
      case AppColorThemeMode.ocean:
        if (typographyMode == AppTypographyThemeMode.poppins) {
          return result.oceanPoppinsAppThemeData;
        } else {
          return result.oceanRobotoAppThemeData;
        }
      case AppColorThemeMode.dracula:
        if (typographyMode == AppTypographyThemeMode.poppins) {
          return result.draculaPoppinsAppThemeData;
        } else {
          return result.draculaRobotoAppThemeData;
        }
      case AppColorThemeMode.system:
        final isSystemDarkMode = overlayStyle == OverlayStyle.light;

        if (typographyMode == AppTypographyThemeMode.poppins) {
          return isSystemDarkMode
              ? result.darkPoppinsAppThemeData
              : result.lightPoppinsAppThemeData;
        } else {
          return isSystemDarkMode
              ? result.darkRobotoAppThemeData
              : result.lightRobotoAppThemeData;
        }
    }
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      lightPoppinsAppThemeData != oldWidget.lightPoppinsAppThemeData ||
      lightRobotoAppThemeData != oldWidget.lightRobotoAppThemeData ||
      darkPoppinsAppThemeData != oldWidget.darkPoppinsAppThemeData ||
      darkRobotoAppThemeData != oldWidget.darkRobotoAppThemeData ||
      oceanPoppinsAppThemeData != oldWidget.oceanPoppinsAppThemeData ||
      oceanRobotoAppThemeData != oldWidget.oceanRobotoAppThemeData ||
      draculaPoppinsAppThemeData != oldWidget.draculaPoppinsAppThemeData ||
      draculaRobotoAppThemeData != oldWidget.draculaRobotoAppThemeData ||
      appThemeMode != oldWidget.appThemeMode;
}
