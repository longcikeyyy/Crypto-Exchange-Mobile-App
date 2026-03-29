import 'package:json_annotation/json_annotation.dart';
part 'order_book_coin.g.dart'; // 

@JsonSerializable()
class OrderBookCoin {
  @JsonKey(name: 's')
  final String symbol;

  @JsonKey(name: 'b')
  final List<List<String>> bids;

  @JsonKey(name: 'a')
  final List<List<String>> asks;

  OrderBookCoin({
    required this.symbol,
    required this.bids,
    required this.asks,
  });

  factory OrderBookCoin.fromJson(Map<String, dynamic> json) =>
      _$OrderBookCoinFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookCoinToJson(this);
}