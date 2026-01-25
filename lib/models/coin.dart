// {
//   "e": "24hrTicker",
//   "E": 1769348192018,
//   "s": "BTCUSDT",
//   "p": "-724.12000000",
//   "P": "-0.809",
//   "w": "88953.22032198",
//   "x": "89536.77000000",
//   "c": "88812.64000000",
//   "Q": "0.00514000",
//   "b": "88812.64000000",
//   "B": "4.43840000",
//   "a": "88812.65000000",
//   "A": "1.96062000",
//   "o": "89536.76000000",
//   "h": "89536.77000000",
//   "l": "88136.00000000",
//   "v": "5790.54619000",
//   "q": "515087731.02368510",
//   "O": 1769261792009,
//   "C": 1769348192009,
//   "F": 5809205373,
//   "L": 5810588020,
//   "n": 1382648
// }

import 'package:json_annotation/json_annotation.dart';
part 'coin.g.dart';

@JsonSerializable()
class Coin {
  @JsonKey(name: 's')
  final String symbol;

  @JsonKey(name: 'c')
  final String currentPrice;

  @JsonKey(name: 'P')
  final String priceChangePercent;

  @JsonKey(name: 'v')
  final String volume;

  Coin({
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercent,
    required this.volume,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
