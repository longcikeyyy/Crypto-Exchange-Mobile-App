import 'package:crypto_exchange_mobile_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/home/home_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/login/account_creation.dart';
import 'package:crypto_exchange_mobile_app/screens/login/signin_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/login/signup_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/onboarding_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/setting/setting_screen.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/trading_chart_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String onboardingScreen = '/onboardingScreen';
  static const String homeScreen = '/homeScreen';
  static const String bottomNav = '/bottomNav';
  static const String settingScreen = '/settingScreen';
  static const String signupScreen = '/signupScreen';
  static const String accountCreationScreen = '/accountCreationScreen';
  static const String signinScreen = '/signinScreen';
  static const String tradingChartScreen = '/tradingChartScreen';

  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen: (context) => const OnboardingScreen(),
    AppRoutes.homeScreen: (context) => const HomeScreen(),
    AppRoutes.bottomNav: (context) => const BottomNavScreen(),
    AppRoutes.settingScreen: (context) => const SettingScreen(),
    AppRoutes.signupScreen: (context) => const SignupScreen(),
    AppRoutes.accountCreationScreen: (context) => const AccountCreationScreen(),
    AppRoutes.signinScreen: (context) => const SigninScreen(),
    AppRoutes.tradingChartScreen: (context) => const TradingChartScreen(),
  };

}
