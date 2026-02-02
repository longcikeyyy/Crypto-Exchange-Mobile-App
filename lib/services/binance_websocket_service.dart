import 'dart:async';
import 'dart:convert';
import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/models/order_book_coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebsocketService {
  /// Declare list of symbols to subscribe
  static const List<String> _symbols = [
    'btcusdt',
    'ethusdt',
    'bnbusdt',
    'solusdt',
    'adausdt',
    'xrpusdt',
    'dotusdt',
    'maticusdt',
    'dogeusdt',
    'avaxusdt',
    'linkusdt',
    'ltcusdt',
    'atomusdt',
    'nearusdt',
    'filusdt',
    'uniusdt',
    'trxusdt',
    'xlmusdt',
    'apeusdt',
    'egldusdt',
  ];

  /// Declare websocket url
  static const String _tickerBinanceWebsocketUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// Declare order book websocket url
  static const String _orderBookBinanceWebsocketUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// Declare websocket channel variable
  WebSocketChannel? _tickerWebSocketChannel;

  ///Declare order book websocket channel variable
  WebSocketChannel? _orderbookWebSocketChannel;

  /// Declare stream varaible
  final StreamController<List<Coin>> _tickerStreamController =
      StreamController<List<Coin>>.broadcast();

  /// Declare order book stream varaible
  final StreamController<List<OrderBookCoin>> _orderBookStreamController =
      StreamController<List<OrderBookCoin>>.broadcast();

  /// Expose ticker stream
  Stream<List<Coin>> get tickerStream => _tickerStreamController.stream;

  /// Expose order book stream
  Stream<List<OrderBookCoin>> get orderBookStream => _orderBookStreamController.stream;

  final Map<String, Coin> _coinsMap = {};
  final Map<String, OrderBookCoin> _orderBookCoinsMap = {};

  List<Coin> get currentCoins => _coinsMap.values.toList();
  List<OrderBookCoin> get currentOrderBookCoins => _orderBookCoinsMap.values.toList();

  /// Implement subscribe to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      /// Create the full stream URL
      final symbolsUrl = _symbols.map((s) => '$s@ticker').join('/');
      final streamUrl = '$_tickerBinanceWebsocketUrl$symbolsUrl';

      /// Connect to the WebSocket channel
      _tickerWebSocketChannel = WebSocketChannel.connect(Uri.parse(streamUrl));

      /// Listen to the stream and process incoming data
      if (_tickerWebSocketChannel == null) {
        debugPrint('WebSocket channel is not initialized');
        throw Exception('WebSocket channel is not initialized');
      }

      _tickerWebSocketChannel!.stream.listen((data) {
        /// Handle incoming data
        final jsonData = jsonDecode(data);
        if (jsonData == null || jsonData['data'] == null) {
          debugPrint('Invalid data received from ticker stream');
          return;
        }
        // debugPrint('Ticker Stream Data: $jsonData');
        final coin = Coin.fromJson(jsonData['data']);
        _coinsMap[coin.symbol] = coin;
        _tickerStreamController.sink.add(_coinsMap.values.toList());
      });
    } catch (e) {
      debugPrint('Error connecting to ticker stream: $e');
    }
  }

  /// Implement subscribe to order book stream
  Future<void> connectToOrderBookStream() async {
    try {
      /// Create the full stream URL
      final symbolsUrl = _symbols.map((s) => '$s@depth').join('/');
      final streamUrl = '$_orderBookBinanceWebsocketUrl$symbolsUrl';

      /// Connect to the WebSocket channel
      _orderbookWebSocketChannel = WebSocketChannel.connect(
        Uri.parse(streamUrl),
      );

      /// Listen to the stream and process incoming data
      if (_orderbookWebSocketChannel == null) {
        debugPrint('WebSocket channel is not initialized');
        throw Exception('WebSocket channel is not initialized');
      }

      _orderbookWebSocketChannel!.stream.listen((data) {
        /// Handle incoming data
        final jsonData = jsonDecode(data);
        if (jsonData == null || jsonData['data'] == null) {
          debugPrint('Invalid data received from order book stream');
          return;
        }
        // debugPrint('Ticker Stream Data: $jsonData');
        final coin = OrderBookCoin.fromJson(jsonData['data']);
        _orderBookCoinsMap[coin.symbol] = coin;
        _orderBookStreamController.sink.add(_orderBookCoinsMap.values.toList());
      });
    } catch (e) {
      debugPrint('Error connecting to ticker stream: $e');
    }
  }

  /// Order book stream
}
