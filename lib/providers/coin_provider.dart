import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  CoinProvider(this._binanceWebsocketRepository) {
    connectToTickerStream();
  }

  /// State variables
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Coin>? _coinInfo = [];
  List<Coin>? get coinInfo => _coinInfo;

  /// Connect to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _binanceWebsocketRepository.connectToTickerStream();

      _binanceWebsocketRepository.tickerStream.listen((coinsList) {
        _coinInfo = coinsList;
        _isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = 'Error connecting to ticker stream: $e';
      notifyListeners();
      debugPrint('Error connecting to ticker stream: $e');
    }
  }
}
