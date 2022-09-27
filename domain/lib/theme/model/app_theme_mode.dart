import 'package:equatable/equatable.dart';

enum OverlayStyle { system, light, dark }

enum AppTypographyThemeMode { poppins, roboto }

enum AppColorThemeMode {
  system(
    style: OverlayStyle.system,
  ),
  light(
    style: OverlayStyle.dark,
  ),
  dark(
    style: OverlayStyle.light,
  ),
  ocean(
    style: OverlayStyle.light,
  ),
  dracula(
    style: OverlayStyle.light,
  );

  final OverlayStyle style;

  const AppColorThemeMode({required this.style});
}

class AppThemeMode extends Equatable {
  final AppColorThemeMode colorMode;
  final AppTypographyThemeMode typographyMode;

  const AppThemeMode({
    required this.colorMode,
    required this.typographyMode,
  });

  @override
  List<Object?> get props => [colorMode, typographyMode];
}
