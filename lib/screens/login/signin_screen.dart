import 'package:crypto_exchange_mobile_app/component/app_appbar.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/screens/login/widget/rich_text_box.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar:AppAppbar(
        title:Image.asset(AppPath.imgCoinmoney),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
      ),
      body:Padding(
        padding:  EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Login to your\nAccount",
                style: AppTextstyle.tsSemiboldSize32,
              ),
            ),
            SizedBox(height:16),
            RichTextBox(
              icon: Icon(Icons.email,
              color:AppColor.blueColor), 
              title: [
                Text(
      "Email address",
      style: AppTextstyle.tsRegularSize12Grey,
    ),
    
    Text(
      "tomashuk.dima.1992@gmail.com",
      style: AppTextstyle.tsRegularSize16Black,
    ),
                 
                ], 
              boxColor: AppColor.whiteColor, 
              borderColor: AppColor.blueColor),
            SizedBox( height:16),
            RichTextBox(
              icon: Image.asset(AppPath.icGoogle), 
              title: [Text("Continue with Google", 
              style: AppTextstyle.tsMediumSize16Black)], 
              boxColor: AppColor.whiteColor, 
              borderColor: AppColor.borderColor),

          ],
        ),
      )
    );
  }
}