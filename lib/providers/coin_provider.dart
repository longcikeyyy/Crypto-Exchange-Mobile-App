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

  List<OrderBookCoin>? _orderBookInfo = [];
  List<OrderBookCoin>? get orderBookInfo => _orderBookInfo;

   /// ===== SELECTED SYMBOL =====
  String _selectedSymbol = 'BTCUSDT';
  String get selectedSymbol => _selectedSymbol;

   void setSelectedSymbol(String symbol) {
    _selectedSymbol = symbol;
    notifyListeners();
  }

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

      _binanceWebsocketRepository.orderBookStream.listen((orderBookList) {
        _orderBookInfo = orderBookList;
        notifyListeners();
      });
    } catch (e) {
      debugPrint('Error connecting to order book stream: $e');
    }
  }

 /// Get selected order book
   OrderBookCoin? get selectedOrderBook {
    // Kiểm tra null và empty trước
    if (_orderBookInfo == null || _orderBookInfo!.isEmpty) {
      return null;
    }
    
    try {
      return _orderBookInfo!.firstWhere((o) => o.symbol == _selectedSymbol);
    } catch (e) {
      // Nếu không tìm thấy symbol, trả về item đầu tiên
      return _orderBookInfo!.first;
    }
  }
}