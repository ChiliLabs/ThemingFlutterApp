import 'package:flutter/material.dart';
import 'package:theming_flutter/theme/widget/app_theme.dart';

class THIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;

  const THIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  State<THIconButton> createState() => _THIconButtonState();
}

class _THIconButtonState extends State<THIconButton>
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
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.primary.primary,
            boxShadow: [
              BoxShadow(
                color: color.primary.primary.withOpacity(0.35),
                offset: const Offset(0, 8),
                blurRadius: 12,
              )
            ],
          ),
          child: Icon(
            widget.icon,
            color: color.text.textSecondary,
          ),
        ),
      ),
    );
  }
}
