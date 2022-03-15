import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class THPrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const THPrimaryButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _THPrimaryButtonState createState() => _THPrimaryButtonState();
}

class _THPrimaryButtonState extends State<THPrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    final typography = appTheme.typography;

    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
        widget.onTap();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.primary.primary,
            boxShadow: [
              BoxShadow(
                color: color.primary.primary.withOpacity(0.35),
                offset: const Offset(0, 8),
                blurRadius: 12,
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Icon(
                widget.icon,
                color: color.text.textSecondary,
              ),
              const SizedBox(width: 16),
              const Spacer(),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: typography.paragraphRegular
                    .copyWith(color: color.text.textSecondary),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
