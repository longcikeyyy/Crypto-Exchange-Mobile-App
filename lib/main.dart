import 'package:crypto_exchange_mobile_app/core/theme/app_theme.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/favorite_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/theme_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/trade_provider.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:crypto_exchange_mobile_app/routes/app_routes.dart';
import 'package:crypto_exchange_mobile_app/services/binance_websocket_service.dart';
import 'package:crypto_exchange_mobile_app/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        Provider(create: (context) => BinanceWebsocketService()),
        Provider(
          create: (context) => BinanceWebsocketRepository(
            context.read<BinanceWebsocketService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CoinProvider(context.read<BinanceWebsocketRepository>()),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              TradeProvider(context.read<BinanceWebsocketRepository>()),
        ),
      ],
      child: MyAppBody(),
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.onboardingScreen,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
    );
  }
}
