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
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.handlePlatformBrightnessChanged();

    _themeRepository = context.read();
    _setUpAppTheme();

    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      _onBrightnessChanged();
    };
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lightPoppinsAppThemeData = AppThemeData.lightPoppins();
    final lightRobotoAppThemeData = AppThemeData.lightRoboto();
    final darkPoppinsAppThemeData = AppThemeData.darkPoppins();
    final darkRobotoAppThemeData = AppThemeData.darkRoboto();
    final oceanPoppinsAppThemeData = AppThemeData.oceanPoppins();
    final oceanRobotoAppThemeData = AppThemeData.oceanRoboto();
    final draculaPoppinsAppThemeData = AppThemeData.draculaPoppins();
    final draculaRobotoAppThemeData = AppThemeData.draculaRoboto();

    return AppThemeSwitcher(
      themeRepository: _themeRepository,
      onThemeSwitch: _onThemeSwitch,
      child: AppTheme(
        lightPoppinsAppThemeData: lightPoppinsAppThemeData,
        lightRobotoAppThemeData: lightRobotoAppThemeData,
        darkPoppinsAppThemeData: darkPoppinsAppThemeData,
        darkRobotoAppThemeData: darkRobotoAppThemeData,
        oceanPoppinsAppThemeData: oceanPoppinsAppThemeData,
        oceanRobotoAppThemeData: oceanRobotoAppThemeData,
        draculaPoppinsAppThemeData: draculaPoppinsAppThemeData,
        draculaRobotoAppThemeData: draculaRobotoAppThemeData,
        appThemeMode: _themeMode,
        child: widget.child,
      ),
    );
  }

  void _onThemeSwitch(AppThemeMode mode) {
    setState(() {
      _themeMode = mode;
      SystemChrome.setSystemUIOverlayStyle(_getOverlayStyle());
    });
  }

  SystemUiOverlayStyle _getOverlayStyle() {
    switch (_themeMode.colorMode.style) {
      case OverlayStyle.dark:
        return SystemUiOverlayStyle.dark;
      case OverlayStyle.light:
        return SystemUiOverlayStyle.light;
      default:
        return _isDarkModeFromDevice
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    }
  }

  void _setUpAppTheme() {
    final window = WidgetsBinding.instance.window;
    _isDarkModeFromDevice = window.platformBrightness == Brightness.dark;

    final colorMode = _themeRepository.getColorThemeMode();
    final typographyMode = _themeRepository.getTypographyThemeMode();
    final appThemeMode = AppThemeMode(
      colorMode: colorMode,
      typographyMode: typographyMode,
    );
    _themeMode = appThemeMode;

    // Set status bar on init
    SystemChrome.setSystemUIOverlayStyle(_getOverlayStyle());
  }

  void _onBrightnessChanged() {
    setState(() {
      final window = WidgetsBinding.instance.window;
      _isDarkModeFromDevice = window.platformBrightness == Brightness.dark;
      if (_themeMode.colorMode == AppColorThemeMode.system) {
        SystemChrome.setSystemUIOverlayStyle(_getOverlayStyle());
      }
    });
  }
}
