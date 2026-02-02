import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/models/order_book_coin.dart';

import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeTokenInfoWidget extends StatelessWidget {
  final OrderBookCoin? orderBookCoin;


  const TradeTokenInfoWidget({super.key, this.orderBookCoin});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoinProvider>(
      builder: (context,coinProvider,_) {
        final OrderBookCoin = coinProvider.orderBookCoin;
        if (coinProvider.orderBookCoinInfo == null) {
          return SizedBox(
            child: Center(child: CircularProgressIndicator()),
          );
        }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                /// TODO: Implement logic to switch trading pairs
                /// show bottomsheet -> display list of token pairs real time
              },
              child: Row(
                children: [
                  Text(
                    OrderBookCoin?.symbol ?? "",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.textColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, color: AppColor.textColor),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\$26,345.67 ",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.greenColor,
                    ),
                  ),
                  TextSpan(
                    text: "+2.34% ",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                  TextSpan(
                    text: "(\$600.00)",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.greenColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            /// TODO: Implement logic navigate to Trading Chart Screen
          },
          child: Icon(Icons.search, color: AppColor.greyColor),
        ),
      ],
    );
  }
    );
}
}