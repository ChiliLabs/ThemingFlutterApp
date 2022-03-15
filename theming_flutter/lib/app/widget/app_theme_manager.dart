import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming_flutter/theme/app_theme_data.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';
import 'package:theming_flutter/theme/widget/app_theme_switcher.dart';

class AppThemeManager extends StatefulWidget {
  final Widget child;

  const AppThemeManager({Key? key, required this.child}) : super(key: key);

  @override
  _AppThemeManagerState createState() => _AppThemeManagerState();
}

class _AppThemeManagerState extends State<AppThemeManager>
    with WidgetsBindingObserver {
  late final ThemeRepository _themeRepository;

  late bool _isDarkModeFromDevice;
  late AppThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance?.handlePlatformBrightnessChanged();

    _themeRepository = context.read();
    _setUpAppTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lightAppThemeData = AppThemeData.light();
    final darkAppThemeData = AppThemeData.dark();

    return AppThemeSwitcher(
        themeRepository: _themeRepository,
        onThemeSwitch: (AppThemeMode mode) {
          setState(() {
            _themeMode = mode;
            SystemChrome.setSystemUIOverlayStyle(_isDarkMode()
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark);
          });
        },
        child: AppTheme(
          lightAppThemeData: lightAppThemeData,
          darkAppThemeData: darkAppThemeData,
          isDarkMode: _isDarkMode(),
          child: widget.child,
        ));
  }

  bool _isDarkMode() =>
      _themeMode == AppThemeMode.dark ||
      (_themeMode == AppThemeMode.system && _isDarkModeFromDevice);

  void _setUpAppTheme() {
    final window = WidgetsBinding.instance?.window;
    _isDarkModeFromDevice = window?.platformBrightness == Brightness.dark;

    final themeMode = _themeRepository.getMode();
    _themeMode = themeMode;

    // Set status bar on init
    SystemChrome.setSystemUIOverlayStyle(
        _isDarkMode() ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);

    // Callback is called every time the brightness changes
    window?.onPlatformBrightnessChanged = () {
      setState(() {
        _isDarkModeFromDevice = window.platformBrightness == Brightness.dark;
        if (_themeMode == AppThemeMode.system) {
          SystemChrome.setSystemUIOverlayStyle(_isDarkModeFromDevice
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark);
        }
      });
    };
  }
}
