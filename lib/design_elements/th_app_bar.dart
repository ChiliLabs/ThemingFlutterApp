import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class THAppBar {
  static PreferredSizeWidget build(
    BuildContext context, {
    String title = '',
    bool enableBackButton = false,
    Widget? trailing,
  }) {
    final theme = AppTheme.of(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          AppBar(
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: theme.typography.displayMedium
                    .copyWith(color: theme.color.text.textPrimary),
              ),
            ),
            leading: enableBackButton ? const _BackButton() : null,
            actions: trailing != null ? [trailing] : [],
            elevation: 0,
            backgroundColor: theme.color.background.background,
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).color;

    return SizedBox(
      height: 44,
      width: 30,
      child: ButtonTheme(
        minWidth: 0,
        height: 30,
        child: TextButton(
          onPressed: () => Navigator.maybePop(context),
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: color.text.textPrimary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
