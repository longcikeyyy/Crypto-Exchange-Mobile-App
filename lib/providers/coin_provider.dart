import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  CoinProvider(this._binanceWebsocketRepository) {
    connectToTickerStream();
  }

  /// define state variables (loading, error, data)
  ///
  List<Coin>? _coinInfo = [];
  List<Coin>? get coinInfo => _coinInfo;

  /// Functions
  Future<void> connectToTickerStream() async {
    try {
      /// connect to repository
      await _binanceWebsocketRepository.connectToTickerStream();

      /// listen to stream and update state
      _binanceWebsocketRepository.tickerStream.listen((coinsList) {
        _coinInfo = coinsList;
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
