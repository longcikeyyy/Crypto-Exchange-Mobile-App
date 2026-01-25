import 'package:crypto_exchange_mobile_app/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 98),
        child: Column(
          children: [
            Center(child: Image.asset(AppPath.imgCoinmoney)),
            SizedBox(height: 81),
            Image.asset(AppPath.imgPerson),
            SizedBox(height: 34),
            Text(
              'Take hold of your\nfinances',
              style: AppTextstyle.tsSemiboldSize32,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 9),
            Text(
              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
              style: AppTextstyle.tsRegularSize14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
