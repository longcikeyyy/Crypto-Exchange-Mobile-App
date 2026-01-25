import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CoinProvider>(
            builder: (_, coinProivder, __) {
              final coin = coinProivder.coinInfo;
              if (coin == null) {
                return Text('No coin data available');
              }
              return Column(
                children: [
                  Text('Home Screen - Total Coins: ${coin.symbol}'),
                  Text(' Price: ${coin.currentPrice}'),
                  Text(' Change: ${coin.priceChangePercent}%'),
                  Text('Volume: ${coin.volume}'),
                ],
              );
            },
          ),
          Switch(
            value: context.watch<ThemeProvider>().isDarkMode,
            onChanged: (value) {
              context.read<ThemeProvider>().toggleThemeMode();
            },
          ),
        ],
      ),
    );
  }
}
