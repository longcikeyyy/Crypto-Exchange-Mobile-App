import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                  separatorBuilder: (_, __) => SizedBox(height: 7),
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final coin = favorites[index];
                    final isPositive = FormatHelper.isPositiveChange(
                      coin.priceChangePercent,
                    );
                    return Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            onPressed: (context) {},
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Archive',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              favoriteProvider.toggleFavorite(coin.symbol);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Remove',
                            padding: EdgeInsets.all(4),
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: _buildCartItemWidget(
                        coin: coin,
                        isPositive: isPositive,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }

  Container _buildCartItemWidget({
    required Coin coin,
    required bool isPositive,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.blueColor.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: coin.symbol.replaceAll('USDT', ''),
                      style: AppTextstyle.tsMediumSize16Black,
                    ),
                    TextSpan(
                      text: "/USDT",
                      style: AppTextstyle.tsRegularSize12Grey,
                    ),
                  ],
                ),
              ),
              Text(
                "Vol ${FormatHelper.formatPrice(coin.volume)}",
                style: AppTextstyle.tsRegularSize14.copyWith(fontSize: 10),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('Top prace 0,01316'),
              Image.asset(AppPath.icVector, width: 100, height: 30),
              Text('Low prace 0,01216'),
            ],
          ),
          SizedBox(width: 12),
          Text(
            FormatHelper.formatPrice(coin.currentPrice),
            style: AppTextstyle.tsRegularSize16Black,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: isPositive
                  ? AppColor.greenColor.withValues(alpha: 0.12)
                  : AppColor.redColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.all(2),
            child: Text(
              "${isPositive ? '+' : ''}${coin.priceChangePercent}%",
              style: AppTextstyle.tsRegularSize14.copyWith(
                color: isPositive ? AppColor.greenColor : AppColor.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
