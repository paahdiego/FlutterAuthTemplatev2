import 'package:auth_template_v2/shared/config/app_sizes.dart';
import 'package:auth_template_v2/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color color, textColor;
  final double hPadding;
  final double vPadding;
  final bool outlined;

  const DefaultButton({
    Key? key,
    this.child,
    this.onPressed,
    this.textColor = AppColors.white,
    this.hPadding = 40,
    this.vPadding = 20,
    this.color = AppColors.primary,
    this.outlined = false,
  }) : super(key: key);

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  double _scale = 1;

  Key? teste;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.05,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {
          _scale = 1 - animationController.value;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    animationController.forward();
  }

  void _tapUp() {
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTapDown: _tapDown,
        onTap: widget.onPressed,
        child: Transform.scale(
          scale: _scale,
          child: TextButton(
            style: ButtonStyle(
              elevation: !widget.outlined
                  ? MaterialStateProperty.all(3.5)
                  : MaterialStateProperty.all(0.5),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: widget.outlined
                      ? BorderSide(
                          color: widget.color,
                        )
                      : BorderSide.none,
                  borderRadius: sizes.defaultBorderRadius,
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: widget.vPadding,
                  horizontal: widget.hPadding,
                ),
              ),
              overlayColor: !widget.outlined
                  ? MaterialStateProperty.all(this.widget.color)
                  : MaterialStateProperty.all(
                      this.widget.color.withOpacity(0.1),
                    ),
              backgroundColor: !widget.outlined
                  ? MaterialStateProperty.all(this.widget.color)
                  : MaterialStateProperty.all(this.widget.textColor),
              foregroundColor: !widget.outlined
                  ? MaterialStateProperty.all(this.widget.textColor)
                  : MaterialStateProperty.all(this.widget.color),
            ),
            onPressed: () {
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
              _tapUp();
            },
            child: this.widget.child!,
          ),
        ),
      ),
    );
  }
}
