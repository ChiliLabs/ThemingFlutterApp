import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTypography extends Equatable {
  final TextStyle displayMedium;
  final TextStyle paragraphRegular;

  const AppTypography({
    required this.displayMedium,
    required this.paragraphRegular,
  });

  static const fontFamily = 'Poppins';

  static const defaultTypography = AppTypography(
    displayMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      height: 1.42,
      letterSpacing: 1,
      fontFamily: fontFamily,
    ),
    paragraphRegular: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.42,
      letterSpacing: 1,
      fontFamily: fontFamily,
    ),
  );

  @override
  List<Object> get props => [displayMedium, paragraphRegular];
}
