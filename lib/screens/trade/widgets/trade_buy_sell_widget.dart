import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class TradeBuySellWidget extends StatelessWidget {
  const TradeBuySellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.blueColor,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackColor.withValues(alpha: 0.04),
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: AppColor.blueColor.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Buy',
                style: AppTextstyle.tsRegularSize14.copyWith(
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Sell',
              textAlign: TextAlign.center,
              style: AppTextstyle.tsRegularSize14.copyWith(
                color: AppColor.greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
