import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteCartItem extends StatelessWidget {
  const FavoriteCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoriteProvider, CoinProvider>(
      builder: (context, favoriteProvider, coinProvider, _) {
        final List<Coin> favorites = favoriteProvider.favoritesFrom(
          coinProvider.coinInfo,
        );
        return Expanded(
          child: favorites.isEmpty
              ? Center(
                  child: Text(
                    "No favorites yet",
                    style: AppTextstyle.tsRegularSize14,
                  ),
                )
              : ListView.separated(
                  itemCount: favorites.length,
                  separatorBuilder: (_, __) =>
                      Divider(thickness: 1, color: AppColor.dividerColor),
                  itemBuilder: (context, index) {
                    final coin = favorites[index];
                    final isPositive = FormatHelper.isPositiveChange(
                      coin.priceChangePercent,
                    );
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "${coin.symbol}/USDT",
                                style: AppTextstyle.tsRegularSize16Black,
                              ),
                              Text("Vol ${coin.volume}",style:AppTextstyle.tsRegularSize14.copyWith(fontSize:10))
                            ],
                          ),
                          SizedBox(width: 100),
                          Row(
                            children: [
                              Text(
                                FormatHelper.formatPrice(coin.currentPrice),
                                style: AppTextstyle.tsRegularSize16Black,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${isPositive ? '+' : ''}${coin.priceChangePercent}%",
                                style: AppTextstyle.tsRegularSize14.copyWith(
                                  color: isPositive
                                      ? AppColor.greenColor
                                      : AppColor.redColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
