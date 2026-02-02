import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeTokenInfoWidget extends StatelessWidget {
  const TradeTokenInfoWidget({super.key});

  void _showCoinSelectionBottomSheet(
    BuildContext context,
    CoinProvider coinProvider,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Coin",
                style: AppTextstyle.tsMediumSize16Black,
              ),
              SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: coinProvider.allOrderBookCoins.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final coin = coinProvider.allOrderBookCoins[index];
                    final isSelected = coin.symbol == coinProvider.selectedOrderBookCoin;
                    
                    return ListTile(
                      title: Text(
                        coin.symbol,
                        style: AppTextstyle.tsRegularSize14.copyWith(
                          color: isSelected ? AppColor.blueColor : AppColor.textColor,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check, color: AppColor.blueColor)
                          : null,
                      onTap: () {
                        coinProvider.setSelectedOrderBookCoinSymbol(coin.symbol);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoinProvider>(
      builder: (context,coinProvider,_) {
        final orderBookCoin = coinProvider.orderBookCoin;
        final selectedCoin = coinProvider.selectedCoinInfo;
        final isPositive = FormatHelper.isPositiveChange(selectedCoin?.priceChangePercent ?? '0');
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
                _showCoinSelectionBottomSheet(context, coinProvider);
              },
              child: Row(
                children: [
                  Text(
                    orderBookCoin?.symbol ?? '',
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
                    text: "\$${FormatHelper.formatPrice(selectedCoin?.currentPrice ?? '0')}",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color:  isPositive ? AppColor.greenColor : AppColor.red100,
                    ),
                  ),
                  TextSpan(
                    text: "≈\$${FormatHelper.formatPrice(selectedCoin?.currentPrice ?? '0')}",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.greyColor,
                    ),
                  ),
                  TextSpan(
                    text: "${isPositive ? '+' : ''}${selectedCoin?.priceChangePercent}%",
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color:  isPositive ? AppColor.greenColor : AppColor.red100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.tradingChartScreen);
          },
          child: Icon(Icons.search, color: AppColor.greyColor),
        ),
      ],
    );
  }
    );
}
}