import 'package:crypto_exchange_mobile_app/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/models/onboarding_data.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Image.asset(AppPath.imgCoinmoney))),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.zero,
            child: Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: OnboardingData.onboardingPages.length,
                itemBuilder: (context, index) {
                  final page = OnboardingData.onboardingPages[index];
                  return _buildPage(page.title, page.description, page.imagePath);
                },
              ),
            ),
          ),
          SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String description, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 34),
        Text(
          title,
          style: AppTextstyle.tsSemiboldSize32,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: AppTextstyle.tsRegularSize14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
