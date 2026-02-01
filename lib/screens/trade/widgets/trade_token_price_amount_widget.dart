import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class TradeTokenPriceAmountWidget extends StatelessWidget {
  const TradeTokenPriceAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "30,113.84",
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.red100,
                      ),
                    ),
                    Text(
                      "2,20046",
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "30,113.84",
                      style: AppTextstyle.tsRegularSize12Grey.copyWith(
                        color: AppColor.greenColor,
                      ),
                    ),
                    Text(
                      "2,20046",
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
