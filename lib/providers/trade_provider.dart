import 'package:flutter/material.dart';

class TradeProvider extends ChangeNotifier {
  TradeProvider();

  int currentTabIndex = 0;

  void updateTabIndex(int index) {
    currentTabIndex = index;
    notifyListeners();
  }
}
