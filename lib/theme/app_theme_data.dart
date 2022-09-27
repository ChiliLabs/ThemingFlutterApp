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

  factory AppThemeData.lightPoppins() => AppThemeData(
        color: AppColor.light(),
        typography: AppTypography.poppins(),
      );

  factory AppThemeData.lightRoboto() => AppThemeData(
        color: AppColor.light(),
        typography: AppTypography.roboto(),
      );

  factory AppThemeData.darkPoppins() => AppThemeData(
        color: AppColor.dark(),
        typography: AppTypography.poppins(),
      );

  factory AppThemeData.darkRoboto() => AppThemeData(
        color: AppColor.dark(),
        typography: AppTypography.roboto(),
      );

  factory AppThemeData.oceanPoppins() => AppThemeData(
        color: AppColor.ocean(),
        typography: AppTypography.poppins(),
      );

  factory AppThemeData.oceanRoboto() => AppThemeData(
        color: AppColor.ocean(),
        typography: AppTypography.roboto(),
      );

  factory AppThemeData.draculaPoppins() => AppThemeData(
        color: AppColor.dracula(),
        typography: AppTypography.poppins(),
      );

  factory AppThemeData.draculaRoboto() => AppThemeData(
        color: AppColor.dracula(),
        typography: AppTypography.roboto(),
      );

  @override
  List<Object> get props => [color, typography];
}
