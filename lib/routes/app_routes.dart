import 'package:crypto_exchange_mobile_app/screens/demo_stream/demo_stream_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/home/home_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String onboardingScreen = '/onboardingScreen';
  static const String homeScreen = '/homeScreen';
  static const String demoStreamScreen = '/demoStreamScreen';
  static const String demoStreamScreen2 = '/demoStreamScreen2';

  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
    AppRoutes.homeScreen: (context) => const HomeScreen(),
    AppRoutes.demoStreamScreen: (context) => const DemoStreamScreen(),
    AppRoutes.demoStreamScreen2: (context) => const DemoStreamScreen2(),
  };
}
