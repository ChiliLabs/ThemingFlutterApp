import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class THAppBar {
  static PreferredSizeWidget build(
    BuildContext context, {
    String title = '',
  }) {
    final theme = AppTheme.of(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Column(
        children: [
          const SizedBox(height: 44),
          AppBar(
            centerTitle: false,
            title: Text(
              title,
              textAlign: TextAlign.left,
              style: theme.typography.displayMedium
                  .copyWith(color: theme.color.text.textPrimary),
            ),
            elevation: 0,
            backgroundColor: theme.color.background.background,
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}
