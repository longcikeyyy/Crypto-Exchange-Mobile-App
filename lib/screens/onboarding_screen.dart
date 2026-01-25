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
      body: Padding(
        padding: EdgeInsets.only(bottom: 98),
        child: Column(
          children: [
            Expanded(
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
                  return _buildPage(
                    page.title,
                    page.description,
                    page.imagePath,
                  );
                },
              ),
            ),
            // Indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                OnboardingData.onboardingPages.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Next button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  if (_currentPage <
                      OnboardingData.onboardingPages.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {}
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('Next', style: AppTextstyle.tsMediumSize16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48),
          ],
        ),
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
