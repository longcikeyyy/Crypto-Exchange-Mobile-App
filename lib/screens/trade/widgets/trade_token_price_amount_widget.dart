import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:crypto_exchange_mobile_app/core/helper/format_helper.dart';
import 'package:crypto_exchange_mobile_app/providers/trade_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeTokenPriceAmountWidget extends StatefulWidget {
  const TradeTokenPriceAmountWidget({super.key});

  @override
  State<TradeTokenPriceAmountWidget> createState() =>
      _TradeTokenPriceAmountWidgetState();
}

class _TradeTokenPriceAmountWidgetState
    extends State<TradeTokenPriceAmountWidget> {
  List<List<String>> orderbookAsks = [];
  List<List<String>> orderbookBids = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<TradeProvider>(
      builder: (context, coinProvider, _) {
        final orderBookCoin = coinProvider.orderBookCoin;
        if (orderBookCoin != null) {
          if (orderBookCoin.asks.isNotEmpty) {
            orderbookAsks = orderBookCoin.asks;
          }
          if (orderBookCoin.bids.isNotEmpty) {
            orderbookBids = orderBookCoin.bids;
          }
        }
        return _buildContent(context, orderbookAsks, orderbookBids);
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<List<String>> asks,
    List<List<String>> bids,
  ) {
    return SizedBox(
      width: (145 / 375) * context.screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order bk No.", style: AppTextstyle.tsRegularSize12Grey),
              Text("Unit", style: AppTextstyle.tsRegularSize12Grey),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blueColor.withValues(alpha: 0.12),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    Text("10", style: AppTextstyle.tsRegularSize14),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: AppColor.textColor),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blueColor.withValues(alpha: 0.12),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    Text("1000", style: AppTextstyle.tsRegularSize14),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: AppColor.textColor),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price", style: AppTextstyle.tsRegularSize12Grey),
              Text("Amount", style: AppTextstyle.tsRegularSize12Grey),
            ],
          ),
          SizedBox(height: 4),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index >= asks.length) return SizedBox.shrink();
                final ask = asks[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FormatHelper.formatPrice(ask[0]),
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.red100,
                      ),
                    ),
                    Text(
                      FormatHelper.formatPrice(ask[1]),
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 4),
              itemCount: 10,
            ),
          ),
          SizedBox(height: 4),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index >= bids.length) return SizedBox.shrink();
                final bid = bids[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FormatHelper.formatPrice(bid[0]),
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.greenColor,
                      ),
                    ),
                    Text(
                      FormatHelper.formatPrice(bid[1]),
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.textColor,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 4),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
