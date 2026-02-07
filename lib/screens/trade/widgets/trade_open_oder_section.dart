import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:provider/provider.dart';

class TradeOpenOrderSection extends StatelessWidget {
  const TradeOpenOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final coinProvider = Provider.of<CoinProvider>(context);
    final orderBook = coinProvider.orderBookCoin;
    final orders = <Map<String, String>>[];
    if (orderBook != null && orderBook.asks.isNotEmpty) {
      final count = orderBook.asks.length < 5 ? orderBook.asks.length : 5;
      for (var i = 0; i < count; i++) {
        final ask = orderBook.asks[i];
        final priceValue = ask.isNotEmpty ? ask[0] : '0';
        final amountValue = ask.length > 1 ? ask[1] : '0';
        double price = double.tryParse(priceValue) ?? 0.0;
        double amount = double.tryParse(amountValue) ?? 0.0;
        final valuePrice = FormatHelper.formatPrice(price.toString());
        final valueAmount = FormatHelper.formatPrice(amount.toString());
        final totalValue = price * amount;
        final totalStr = totalValue == 0.0
            ? '0'
            : '≈${FormatHelper.formatPrice(totalValue.toString())} USDT';
        orders.add({
          'pair': orderBook.symbol,
          'price': valuePrice,
          'amount': valueAmount,
          'filled': '0.00%',
          'total': totalStr,
          'date': DateTime.now().toString().split('.').first,
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (orders.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'No open orders for ${orderBook?.symbol ?? '—'}',
              style: AppTextstyle.tsRegularSize12Grey,
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (_, __) =>
                Divider(height: 24, color: AppColor.dividerColor),
            itemBuilder: (context, index) {
              final item = orders[index];
              return _OpenOrderCard(
                pair: item['pair']!,
                price: item['price']!,
                amount: item['amount']!,
                filled: item['filled']!,
                total: item['total']!,
                date: item['date']!,
              );
            },
          ),
      ],
    );
  }
}

class _OpenOrderCard extends StatelessWidget {
  final String pair;
  final String price;
  final String amount;
  final String filled;
  final String total;
  final String date;

  const _OpenOrderCard({
    required this.pair,
    required this.price,
    required this.amount,
    required this.filled,
    required this.total,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: (156 / 375) * context.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$pair/USDT", style: AppTextstyle.tsRegularSize14),
                  SizedBox(height: 9),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sell ',
                          style: AppTextstyle.tsRegularSize16Black.copyWith(
                            color: AppColor.redColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Limit',
                          style: AppTextstyle.tsRegularSize16Black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: AppTextstyle.tsRegularSize14.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),
                      Text(price, style: AppTextstyle.tsRegularSize14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: AppTextstyle.tsRegularSize14.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),
                      Text(amount, style: AppTextstyle.tsRegularSize14),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: AppTextstyle.tsRegularSize14.copyWith(
                      color: AppColor.grayColor,
                    ),
                  ),
                  SizedBox(height:8),
                  Container(
                    width: 80,
                    height: 28,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blueColor.withValues(alpha: 0.12),
                          offset: Offset(0, 3),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Cancel',
                      style: AppTextstyle.tsMediumSize16Black.copyWith(
                        color: AppColor.grayColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filled",
                        style: AppTextstyle.tsRegularSize14.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),
                      Text(filled, style: AppTextstyle.tsRegularSize14),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: AppTextstyle.tsRegularSize14.copyWith(
                          color: AppColor.grayColor,
                        ),
                      ),
                      Text(total, style: AppTextstyle.tsRegularSize14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
