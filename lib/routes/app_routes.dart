import 'package:crypto_exchange_mobile_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String onboardingScreen = '/onboardingScreen';

  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
  };
}
