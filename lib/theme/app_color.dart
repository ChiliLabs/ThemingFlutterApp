import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppColor extends Equatable {
  final Primary primary;
  final Text text;
  final Background background;

  const AppColor({
    required this.text,
    required this.primary,
    required this.background,
  });

  factory AppColor.light() => AppColor(
        primary: Primary.light(),
        text: Text.light(),
        background: Background.light(),
      );

  factory AppColor.dark() => AppColor(
        primary: Primary.dark(),
        text: Text.dark(),
        background: Background.dark(),
      );

  @override
  List<Object?> get props => [text, primary, background];
}

class Text extends Equatable {
  final Color textPrimary;
  final Color textSecondary;

  const Text({
    required this.textPrimary,
    required this.textSecondary,
  });

  factory Text.light() => const Text(
        textPrimary: Color(0xFF051A28),
        textSecondary: Color(0xFFF3F3F6),
      );

  factory Text.dark() => const Text(
        textPrimary: Color(0xFFFFFFFF),
        textSecondary: Color(0xFFF3F3F6),
      );

  @override
  List<Object?> get props => [textPrimary, textSecondary];
}

class Primary extends Equatable {
  final Color primary;

  const Primary({required this.primary});

  factory Primary.light() => const Primary(primary: Color(0xFFED4850));

  factory Primary.dark() => const Primary(primary: Color(0xFFED4850));

  @override
  List<Object?> get props => [primary];
}

class Background extends Equatable {
  final Color background;
  final Color surface;

  const Background({required this.background, required this.surface});

  factory Background.light() => const Background(
        background: Color(0xFFFFFFFF),
        surface: Color(0xFFF3F3F6),
      );

  factory Background.dark() => const Background(
        background: Color(0xFF121212),
        surface: Color(0xFF202020),
      );

  @override
  List<Object?> get props => [background, surface];
}
