import 'package:flutter/material.dart';

class RichTextBox extends StatelessWidget {
  final List<Widget>? title;
  final Widget? icon;
  final Widget? suffixIcon;
  final Color boxColor;
  final Color borderColor;
  
  const RichTextBox({
    super.key,
    required this.title,
    this.icon,
    this.suffixIcon,
    required this.boxColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      width: 343,
      height: 56,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != null && title!.length > 1) title![0],
          Row(
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: 12),
              ],
              title != null && title!.length > 1 
                  ? title![1] 
                  : (title != null && title!.isNotEmpty ? title![0] : SizedBox()),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ],
      ),
    );
  }
}