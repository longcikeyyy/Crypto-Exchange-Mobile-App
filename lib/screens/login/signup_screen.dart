import 'package:crypto_exchange_mobile_app/component/app_appbar.dart';
import 'package:crypto_exchange_mobile_app/component/app_button.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/routes/app_routes.dart';
import 'package:crypto_exchange_mobile_app/screens/login/widget/rich_text_box.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppAppbar(title: Image.asset(AppPath.imgCoinmoney)),
      body: Padding(
        padding: EdgeInsets.only(top: 44),
        child: Column(
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Hello! Start your\ncrypto investment\ntoday",
                style: AppTextstyle.tsSemiboldSize32,
              ),
            ),
            SizedBox(height: 24),
            RichTextBox(icon: Image.asset(AppPath.icFacebook), title: [Text("Continue with Facebook", style: AppTextstyle.tsMediumSize16Black)], boxColor: AppColor.whiteColor, borderColor: AppColor.borderColor),
            SizedBox(height: 16),
            RichTextBox(icon: Image.asset(AppPath.icGoogle), title: [Text("Continue with Google", style: AppTextstyle.tsMediumSize16Black)], boxColor: AppColor.whiteColor, borderColor: AppColor.borderColor),
            SizedBox(height: 16),
            RichTextBox(icon: Image.asset(AppPath.icApple), title: [Text("Continue with Apple", style: AppTextstyle.tsMediumSize16Black)], boxColor: AppColor.whiteColor, borderColor: AppColor.borderColor),
            SizedBox(height: 16),
            AppButton(
              title: "Sign up with Email",
              width: 343,
              color: AppColor.blueColor,
              textStyle: AppTextstyle.tsMediumSize16,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.accountCreationScreen);
              },
            ),
            SizedBox(height: 108),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Divider(color: AppColor.dividerColor, height: 1),
                ),
                SizedBox(width: 8),
                Text(
                  "Already have an account?",
                  style: AppTextstyle.tsRegularSize14,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Divider(color: AppColor.dividerColor, height: 1),
                ),
              ],
            ),
            SizedBox(height: 36),
            AppButton(
              title: "Sign In",
              width: 343,
              color: AppColor.whiteColor,
              textStyle: AppTextstyle.tsMediumSize16Blue,
              borderColor: AppColor.blueColor,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signinScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  
}
