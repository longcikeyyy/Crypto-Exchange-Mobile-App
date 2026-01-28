import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/services/binance_websocket_service.dart';
import 'package:flutter/material.dart';

class BinanceWebsocketRepository {
  final BinanceWebsocketService _binanceWebsocketService;

  BinanceWebsocketRepository(this._binanceWebsocketService);

  Stream<List<Coin>> get tickerStream => _binanceWebsocketService.tickerStream;

  /// Connect to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      await _binanceWebsocketService.connectToTickerStream();
    } catch (e) {
      debugPrint('Error in repository while connecting to ticker stream: $e');
      throw Exception(
        'Error in repository while connecting to ticker stream: $e',
      );
    }
  }
}
