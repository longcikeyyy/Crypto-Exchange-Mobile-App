import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.blackColor100,

    /// color scheme -> app color
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.white,
    ),

    //// typography -> text style
    typography: Typography(
      black: TextTheme(
        bodyLarge: TextStyle(color: AppColor.whiteColor),
        bodyMedium: TextStyle(color: AppColor.whiteColor),
        bodySmall: TextStyle(color: AppColor.whiteColor),
      ),
    ),
  );

  /// Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.backgroundColor,

    /// color scheme -> app color
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.black,
    ),

    /// typography -> text style
    typography: Typography(
      black: TextTheme(
        bodyLarge: TextStyle(color: AppColor.textColor),
        bodyMedium: TextStyle(color: AppColor.textColor),
        bodySmall: TextStyle(color: AppColor.textColor),
      ),
    ),
  );
}
