import 'package:crypto_exchange_mobile_app/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    init();
  }

  /// init function
  Future<void> init() async {
    _isDarkMode = await LocalStorageService.instance.getThemeMode() ?? false;
    notifyListeners();
  }

  /// toggle theme mode
  Future<void> toggleThemeMode() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await LocalStorageService.instance.setThemeMode(_isDarkMode);
  }
}
