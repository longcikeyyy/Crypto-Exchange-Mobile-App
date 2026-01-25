import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppTextstyle {
  /// Regular -> 400
  /// Medium -> 500
  /// Semi-Bold -> 600

  static String fontFamily = 'ReadexPro';

  static TextStyle tsSemiboldSize32 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor,
  );
  static TextStyle tsRegularSize14 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textColor,
  );
  static TextStyle tsMediumSize16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
}
