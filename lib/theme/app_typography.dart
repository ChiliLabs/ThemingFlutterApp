import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTypography extends Equatable {
  final TextStyle displayMedium;
  final TextStyle subtitle;
  final TextStyle paragraphRegular;

  const AppTypography({
    required this.displayMedium,
    required this.subtitle,
    required this.paragraphRegular,
  });

  static const poppinsFontFamily = 'Poppins';
  static const robotoMonoFontFamily = 'RobotoMono';

  factory AppTypography.poppins() => typography(poppinsFontFamily);

  factory AppTypography.roboto() => typography(robotoMonoFontFamily);

  static AppTypography typography(String fontFamily) => AppTypography(
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
          letterSpacing: -1.75,
          height: 1,
          fontFamily: fontFamily,
        ),
        subtitle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          letterSpacing: -1,
          height: 1,
          fontFamily: fontFamily,
        ),
        paragraphRegular: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          letterSpacing: -0.1,
          height: 1,
          fontFamily: fontFamily,
        ),
      );

  @override
  List<Object> get props => [displayMedium, paragraphRegular];
}
