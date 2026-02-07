import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/enum/button_type.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.height,
    super.key,
    required this.title,
    this.width,
    this.onTap,
    this.type = ButtonType.primary,
    this.prefixIconPath,
    this.suffixIconPath,
  });

  final String title;
  final double? width;
  final ButtonType type;
  final VoidCallback? onTap;
  final String? prefixIconPath;
  final String? suffixIconPath;
  
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? (context.screenWidth - 32),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _buildBackgroundColor(),
          border: Border.all(color: _buildBorderColor(), width: _borderWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIconPath != null) ...[
              Image.asset(prefixIconPath!, width: 24, height: 24),
              SizedBox(width: 4),
            ],
            Text(title, style: _buildTextStyle()),
            if (suffixIconPath != null) ...[
              SizedBox(width: 4),
              Image.asset(suffixIconPath!, width: 24, height: 24),
            ],
          ],
        ),
      ),
    );
  }

  double get _borderWidth {
    switch (type) {
      case ButtonType.primary:
        return 1;
      case ButtonType.secondary:
        return 2;
      case ButtonType.disabled:
        return 1;
    }
  }

  Color _buildBorderColor() {
    switch (type) {
      case ButtonType.primary:
        return AppColor.blueColor;
      case ButtonType.secondary:
        return AppColor.blueColor;
      case ButtonType.disabled:
        return AppColor.borderColor;
    }
  }

  Color _buildBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return AppColor.blueColor;
      case ButtonType.secondary:
        return AppColor.whiteColor;
      case ButtonType.disabled:
        return AppColor.borderColor;
    }
  }

  TextStyle _buildTextStyle() {
    switch (type) {
      case ButtonType.primary:
        return AppTextstyle.tsMediumSize16;
      case ButtonType.secondary:
        return AppTextstyle.tsMediumSize16Black.copyWith(
          color: AppColor.blueColor,
        );
      case ButtonType.disabled:
        return AppTextstyle.tsMediumSize16Black.copyWith(
          color: AppColor.grayColor,
        );
    }
  }
}
