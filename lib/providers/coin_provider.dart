import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/models/order_book_coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  CoinProvider(this._binanceWebsocketRepository) {
    connectToTickerStream();
    connectToOrderBookStream();
  }

  /// State variables
  List<Coin>? _coinInfo = [];
  List<Coin>? get coinInfo => _coinInfo;

  List<OrderBookCoin>? _orderBookCoinInfo = [];
  List<OrderBookCoin>? get orderBookCoinInfo => _orderBookCoinInfo;

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

  /// Connect to order book stream
  Future<void> connectToOrderBookStream() async {
    try {
      await _binanceWebsocketRepository.connectToOrderBookStream();

      _binanceWebsocketRepository.orderBookStream.listen((orderBookCoinsList) {
        _orderBookCoinInfo = orderBookCoinsList;
        notifyListeners();
      });
    } catch (e) {
      debugPrint('Error connecting to order book stream: $e');
    }
  }

  /// Get all order book coins
  List<OrderBookCoin> get allOrderBooks => _orderBookCoinInfo ?? [];

/// Get first order book coin  
 OrderBookCoin? get orderBookCoin {
    if (_orderBookCoinInfo == null || _orderBookCoinInfo!.isEmpty) return null;
    return _orderBookCoinInfo!.first;
  }
  
  }

 

 


