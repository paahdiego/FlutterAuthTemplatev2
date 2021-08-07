import 'package:auth_template_v2/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultLoadingIcon extends StatelessWidget {
  const DefaultLoadingIcon({
    Key? key,
    this.valueColor = AppColors.primary,
    this.size = 24,
    this.stroke = 2.5,
  }) : super(key: key);

  final Color valueColor;
  final double size;
  final double stroke;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: stroke,
        valueColor: AlwaysStoppedAnimation<Color>(
          valueColor,
        ),
      ),
    );
  }
}
