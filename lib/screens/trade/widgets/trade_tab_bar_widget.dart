import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:crypto_exchange_mobile_app/providers/trade_provider.dart';
import 'package:flutter/material.dart';

class TradeTabBarWidget extends StatelessWidget {
  final TradeProvider tradeProvider;
  const TradeTabBarWidget({super.key, required this.tradeProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (32 / 812) * context.screenHeight,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.gray100,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: TabBar(
        onTap: (index) {
          tradeProvider.updateTabIndex(index);
        },
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        indicatorWeight: 0.0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          color: Colors.transparent, // Makes the indicator area transparent
        ),
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        tabs: [
          _buildTab(
            context: context,
            title: "Spot",
            isSelected: tradeProvider.currentTabIndex == 0,
          ),
          _buildTab(
            context: context,
            title: "Margin",
            isSelected: tradeProvider.currentTabIndex == 1,
          ),
          _buildTab(
            context: context,
            title: "Grid",
            isSelected: tradeProvider.currentTabIndex == 2,
          ),
          _buildTab(
            context: context,
            title: "Fiat",
            isSelected: tradeProvider.currentTabIndex == 3,
          ),
        ],
      ),
    );
  }

  Container _buildTab({
    required BuildContext context,
    required String title,
    required bool isSelected,
  }) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColor.whiteColor,
            )
          : null,
      height: (28 / 812) * context.screenHeight,
      width: (context.screenWidth - 32 - 4) / 4,
      padding: EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.center,
      child: Text(title, style: AppTextstyle.tsRegularSize14),
    );
  }
}
