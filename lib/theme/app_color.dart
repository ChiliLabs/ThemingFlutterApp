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

  factory AppColor.light() {
    return AppColor(
      primary: Primary.light(),
      text: Text.light(),
      background: Background.light(),
    );
  }

  factory AppColor.dark() {
    return AppColor(
      primary: Primary.dark(),
      text: Text.dark(),
      background: Background.dark(),
    );
  }

  factory AppColor.ocean() {
    return AppColor(
      primary: Primary.ocean(),
      text: Text.ocean(),
      background: Background.ocean(),
    );
  }

  factory AppColor.dracula() {
    return AppColor(
      primary: Primary.dracula(),
      text: Text.dracula(),
      background: Background.dracula(),
    );
  }

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

  factory Text.light() {
    return const Text(
      textPrimary: Color(0xFF051A28),
      textSecondary: Color(0xFFF3F3F6),
    );
  }

  factory Text.dark() {
    return const Text(
      textPrimary: Color(0xFFFFFFFF),
      textSecondary: Color(0xFF051A28),
    );
  }

  factory Text.ocean() {
    return const Text(
      textPrimary: Color(0xFF8be9fd),
      textSecondary: Color(0xFF064273),
    );
  }

  factory Text.dracula() {
    return const Text(
      textPrimary: Color(0xFFff79c6),
      textSecondary: Color(0xFF282a36),
    );
  }

  @override
  List<Object?> get props => [textPrimary, textSecondary];
}

class Primary extends Equatable {
  final Color primary;

  const Primary({required this.primary});

  factory Primary.light() {
    return const Primary(primary: Color(0xFF000000));
  }

  factory Primary.dark() {
    return const Primary(primary: Color(0xFFFFFFFF));
  }

  factory Primary.ocean() {
    return const Primary(primary: Color(0xFF05F2DB));
  }

  factory Primary.dracula() {
    return const Primary(primary: Color(0xFF6272a4));
  }

  @override
  List<Object?> get props => [primary];
}

class Background extends Equatable {
  final Color background;
  final Color surface;

  const Background({
    required this.background,
    required this.surface,
  });

  factory Background.light() {
    return const Background(
      background: Color(0xFFFFFFFF),
      surface: Color(0xFFF3F3F6),
    );
  }

  factory Background.dark() {
    return const Background(
      background: Color(0xFF121212),
      surface: Color(0xFF202020),
    );
  }

  factory Background.ocean() {
    return const Background(
      background: Color(0xFF064273),
      surface: Color(0xFF1da2d8),
    );
  }

  factory Background.dracula() {
    return const Background(
      background: Color(0xFF282a36),
      surface: Color(0xFF44475a),
    );
  }

  @override
  List<Object?> get props => [background, surface];
}
