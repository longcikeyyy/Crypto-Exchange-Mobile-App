import 'dart:async';
import 'dart:convert';

import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebsocketService {
  /// Implemen websocket connection to Binance API

  /// Ticker stream
  /// Declare websocket url
  static const String _tickerBinanceWebsocketUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// Declare websocket channel variable
  WebSocketChannel? _tickerWebSocketChannel;

  /// Declare stream varaible
  final StreamController<List<Coin>> _tickerStreamController =
      StreamController<List<Coin>>.broadcast();

  /// Expose ticker stream
  Stream<List<Coin>> get tickerStream => _tickerStreamController.stream;

  final Map<String, Coin> _coinsMap = {};

  List<Coin> get currentCoins => _coinsMap.values.toList();

  /// Implement subscribe to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      final symbols = [
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

      /// Create the full stream URL
      final symbolsUrl = symbols.map((s) => '$s@ticker').join('/');
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

  /// Order book stream
}
