// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBookCoin _$OrderBookCoinFromJson(Map<String, dynamic> json) =>
    OrderBookCoin(
      symbol: json['s'] as String,
      bids: (json['b'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      asks: (json['a'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$OrderBookCoinToJson(OrderBookCoin instance) =>
    <String, dynamic>{
      's': instance.symbol,
      'b': instance.bids,
      'a': instance.asks,
    };
