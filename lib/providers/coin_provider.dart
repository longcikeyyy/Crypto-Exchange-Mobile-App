import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  CoinProvider(this._binanceWebsocketRepository) {
    connectToTickerStream();
  }

  /// State variables
  List<Coin>? _coinInfo = [];
  List<Coin>? get coinInfo => _coinInfo;

  /// Connect to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      await _binanceWebsocketRepository.connectToTickerStream();

      _binanceWebsocketRepository.tickerStream.listen((coinsList) {
        _coinInfo = coinsList;
        notifyListeners();
      });
    } catch (e) {
      debugPrint('Error connecting to ticker stream: $e');
    }
  }
}
