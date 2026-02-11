import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class AppCoinCardPortfolio extends StatelessWidget {
  final Coin coin;
  const AppCoinCardPortfolio({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final isPositive = FormatHelper.isPositiveChange(coin.priceChangePercent);
    return Container(
      height: 68,
      width: 347,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 3),
            color: AppColor.blueColor.withValues(alpha: 0.12),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppPath.icCoin),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coin.symbol,
                      style: AppTextstyle.tsRegularSize16Black,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "BTC",
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Consumer<FavoriteProvider>(
                  builder: (context, favProvider, _) {
                    final isFav = favProvider.isFavorite(coin.symbol);
                    return IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_outlined,
                        color: isFav ? Colors.black : AppColor.grayColor,
                      ),
                      onPressed: () => favProvider.toggleFavorite(coin),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$${FormatHelper.formatPrice(coin.currentPrice)}",
                      style: AppTextstyle.tsRegularSize16Black,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${isPositive ? '+' : ''}${coin.priceChangePercent}%",
                      style: AppTextstyle.tsRegularSize14.copyWith(
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
