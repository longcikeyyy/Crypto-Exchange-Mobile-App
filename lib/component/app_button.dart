
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.width,
    this.onTap,
    required this.color,
    required this.textStyle,
    this.borderColor,
  });
  final String title;
  final double width;
  final Color color;
  final Color? borderColor;
  final TextStyle textStyle;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
