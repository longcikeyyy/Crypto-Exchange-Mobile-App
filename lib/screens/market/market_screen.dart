import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MarketScreen");
    return Scaffold(body: Center(child: Text("Market Screen")));
  }
}
