import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/models/order_book_coin.dart';
import 'package:crypto_exchange_mobile_app/repositories/binance_websocket_repository.dart';
import 'package:flutter/material.dart';

class TradeProvider extends ChangeNotifier {
  final BinanceWebsocketRepository _binanceWebsocketRepository;

  TradeProvider(this._binanceWebsocketRepository) {
    connectToOrderBookStream();
  }

  List<OrderBookCoin>? _orderBookCoinInfo = [];
  List<OrderBookCoin>? get orderBookCoinInfo => _orderBookCoinInfo;

  /// Selected coin for order book in trade screen (default: BTCUSDT)
  String _selectedOrderBookCoin = 'BTCUSDT';
  String get selectedOrderBookCoin => _selectedOrderBookCoin;

  int currentTabIndex = 0;

  void updateTabIndex(int index) {
    currentTabIndex = index;
    notifyListeners();
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

  ///Methods

  /// Set selected order book coin symbol
  void setSelectedOrderBookCoinSymbol(String symbol) {
    _selectedOrderBookCoin = symbol.toUpperCase();
    notifyListeners();
  }

  /// Get all order book coins
  List<OrderBookCoin> get allOrderBookCoins => _orderBookCoinInfo ?? [];

  /// Get order book coin for selected coin in trade screen
  OrderBookCoin? get orderBookCoin {
    if (_orderBookCoinInfo == null || _orderBookCoinInfo!.isEmpty) return null;
    try {
      return _orderBookCoinInfo!.firstWhere(
        (coin) => coin.symbol.toUpperCase() == _selectedOrderBookCoin,
      );
    } catch (e) {
      // If selected symbol not found, return first available
      return _orderBookCoinInfo!.isNotEmpty ? _orderBookCoinInfo!.first : null;
    }
  }

  /// Get order book coin by symbol
  OrderBookCoin? getOrderBookBySymbol(String symbol) {
    if (_orderBookCoinInfo == null || _orderBookCoinInfo!.isEmpty) return null;
    try {
      return _orderBookCoinInfo!.firstWhere(
        (coin) => coin.symbol.toUpperCase() == symbol.toUpperCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get selected coin info in trade screen
  Coin? selectedOrderBookCoinInfo(List<Coin> coinInfo) {
    if (coinInfo.isEmpty) return null;
    try {
      return coinInfo.firstWhere(
        (coin) =>
            coin.symbol.toUpperCase() == _selectedOrderBookCoin.toUpperCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
