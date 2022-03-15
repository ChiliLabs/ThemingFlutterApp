import 'package:equatable/equatable.dart';
import 'package:theming_flutter/theme/app_color.dart';
import 'package:theming_flutter/theme/app_typography.dart';

class AppThemeData extends Equatable {
  final AppColor color;
  final AppTypography typography;

  const AppThemeData({
    required this.color,
    required this.typography,
  });

  factory AppThemeData.light() => AppThemeData(
        color: AppColor.light(),
        typography: AppTypography.defaultTypography,
      );

  factory AppThemeData.dark() => AppThemeData(
        color: AppColor.dark(),
        typography: AppTypography.defaultTypography,
      );

  @override
  List<Object> get props => [color, typography];
}
