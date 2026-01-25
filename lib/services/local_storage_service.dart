import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  /// init local storage using private constructor
  LocalStorageService._privateConstructor();

  static final LocalStorageService instance =
      LocalStorageService._privateConstructor();

  /// define keys
  static const String themeModeKey = 'themeModeKey';
  static const String onboardingKey = 'onboardingKey';

  /// variables
  late SharedPreferences sharedPreferences;

  /// functions

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setThemeMode(bool isDarkMode) async {
    // Save theme mode to local storage
    await sharedPreferences.setBool(themeModeKey, isDarkMode);
  }

  Future<bool?> getThemeMode() async {
    // Get theme mode from local storage
    return sharedPreferences.getBool(themeModeKey);
  }
}
