import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:flutter/material.dart';

class AppCoinCardMarket extends StatelessWidget {
  final Coin coin;
  const AppCoinCardMarket({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final isPositive = FormatHelper.isPositiveChange(coin.priceChangePercent);

    return Container(
      height: 172,
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.whiteColor,
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
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coin.symbol, style: AppTextstyle.tsRegularSize16Black),

                    Text(
                      "\$${FormatHelper.formatPrice(coin.currentPrice)}",
                      style: AppTextstyle.tsRegularSize16Black,
                    ),
                  ],
                ),
                Image.asset(AppPath.icCoin),
              ],
            ),
            // Price Change Percentage
            Text(
              "${isPositive ? '+' : ''}${coin.priceChangePercent}%",
              style: AppTextstyle.tsRegularSize14.copyWith(
                color: isPositive ? AppColor.greenColor : AppColor.redColor,
              ),
            ),
            SizedBox(height: 4),
            Center(child: Image.asset(AppPath.icVector)),
            SizedBox(height: 4),
            Text("24H Vol.", style: AppTextstyle.tsRegularSize12Grey),
            Text(coin.volume, style: AppTextstyle.tsRegularSize12Grey),
          ],
        ),
      ),
    );
  }
}
