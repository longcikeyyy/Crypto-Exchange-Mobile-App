import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  CoinProvider(this._binanceWebsocketRepository) {
    connectToTickerStream(symbol: 'btcusdt');
  }

  /// define state variables (loading, error, data)
  ///
  Coin? _coinInfo;
  Coin? get coinInfo => _coinInfo;

  /// Functions
  Future<void> connectToTickerStream({required String symbol}) async {
    try {
      /// connect to repository
      await _binanceWebsocketRepository.connectToTickerStream(symbol: symbol);

      /// listen to stream and update state
      _binanceWebsocketRepository.tickerStream.listen((data) {
        _coinInfo = data;
        notifyListeners();
      });
    } catch (e) {
      debugPrint('Error in provider while connecting to ticker stream: $e');
      throw Exception(
        'Error in provider while connecting to ticker stream: $e',
      );
    }
  }
}
