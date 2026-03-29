import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class TradeOrderTypeWidget extends StatelessWidget {
  const TradeOrderTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColor.blueColor.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Limit", style: AppTextstyle.tsRegularSize14),
          Icon(Icons.keyboard_arrow_down, color: AppColor.textColor),
        ],
      ),
    );
  }
}
