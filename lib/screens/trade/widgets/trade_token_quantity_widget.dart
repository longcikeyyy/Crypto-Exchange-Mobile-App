import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class TradeTokenQuantityWidget extends StatelessWidget {
  final String volume;
  final String currency;
  const TradeTokenQuantityWidget({
    super.key,
    required this.volume,
    this.currency = "USDT",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColor.blueColor.withValues(alpha: 0.24),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Text(volume)),
          Text(currency, style: AppTextstyle.tsRegularSize14),
        ],
      ),
    );
  }
}
