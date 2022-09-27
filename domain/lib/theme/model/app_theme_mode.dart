import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

// All available color themes
enum AppColorThemeMode { system, light, dark, ocean, dracula }

// All available text styles
enum AppTypographyThemeMode { poppins, roboto }

// All available status bar modes
enum OverlayStyle { light, dark }

// Overlay styles based on theme mode
extension AppColorModeOverlayStyle on AppColorThemeMode {
  OverlayStyle getOverlayStyleByColorMode(Brightness windowBrightness) {
    switch (this) {
      case AppColorThemeMode.light:
        return OverlayStyle.dark;
      case AppColorThemeMode.dark:
        return OverlayStyle.light;
      case AppColorThemeMode.ocean:
        return OverlayStyle.light;
      case AppColorThemeMode.dracula:
        return OverlayStyle.light;
      case AppColorThemeMode.system:
        final isSystemDarkMode = windowBrightness == Brightness.dark;
        return isSystemDarkMode ? OverlayStyle.light : OverlayStyle.dark;
    }
  }
}

class AppThemeMode extends Equatable {
  final AppColorThemeMode colorMode;
  final AppTypographyThemeMode typographyMode;
  final OverlayStyle overlayStyle;

  const AppThemeMode({
    required this.colorMode,
    required this.typographyMode,
    required this.overlayStyle,
  });

  @override
  List<Object?> get props => [colorMode, typographyMode, overlayStyle];
}
