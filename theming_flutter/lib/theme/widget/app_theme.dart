import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData lightAppThemeData;
  final AppThemeData darkAppThemeData;
  final bool isDarkMode;

  const AppTheme({
    Key? key,
    required this.lightAppThemeData,
    required this.darkAppThemeData,
    required this.isDarkMode,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (result == null) {
      throw 'No AppTheme found in context';
    }

    return result.isDarkMode
        ? result.darkAppThemeData
        : result.lightAppThemeData;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      lightAppThemeData != oldWidget.lightAppThemeData ||
      darkAppThemeData != oldWidget.darkAppThemeData ||
      isDarkMode != oldWidget.isDarkMode;
}
