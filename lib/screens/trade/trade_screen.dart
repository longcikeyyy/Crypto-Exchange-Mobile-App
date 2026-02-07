import 'package:crypto_exchange_mobile_app/component/app_appbar.dart';
import 'package:crypto_exchange_mobile_app/component/app_button.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:crypto_exchange_mobile_app/providers/trade_provider.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_buy_sell_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_open_oder_section.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_order_type_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_order_volume_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_tab_bar_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_token_info_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_token_price_amount_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/trade/widgets/trade_token_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with SingleTickerProviderStateMixin {
  bool _hideOtherPairs = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<TradeProvider>(
      builder: (_, tradeProvider, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppAppbar(
            title: Text("Trade"),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
            ],
          ),
          body: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                TradeTabBarWidget(tradeProvider: tradeProvider),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildSpotView(),
                      Center(child: Text("Margin Content")),
                      Center(child: Text("Grid Content")),
                      Center(child: Text("Fiat Content")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SingleChildScrollView _buildSpotView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TradeTokenInfoWidget(),
          SizedBox(height: 17),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TradeTokenPriceAmountWidget(),
                SizedBox(width: 13),
                SizedBox(
                  width: (188 / 375) * context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TradeBuySellWidget(),
                      SizedBox(height: 24),
                      TradeOrderTypeWidget(),
                      SizedBox(height: 8),
                      Text(
                        "Available:",
                        style: AppTextstyle.tsRegularSize12Grey,
                      ),
                      SizedBox(height: 4),
                      Text("1000 USDT", style: AppTextstyle.tsRegularSize14),
                      SizedBox(height: 24),
                      TradeOrderVolumeWidget(volume: "30,113.80"),
                      SizedBox(height: 8),
                      TradeOrderVolumeWidget(
                        volume: "0.04014",
                        currency: "BTC",
                      ),
                      SizedBox(height: 40),
                      Slider(
                        min: 1,
                        max: 100,
                        value: 20,
                        padding: EdgeInsets.zero,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 8),
                      TradeTokenQuantityWidget(volume: "1000"),
                      SizedBox(height: 16),
                      AppButton(title: 'Buy BTC'),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Open Orders", style: AppTextstyle.tsMediumSize16Black),
              Text("More", style: AppTextstyle.tsMediumSize16Blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _hideOtherPairs,
                      onChanged: (value) {
                        setState(() {
                          _hideOtherPairs = value ?? false;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("Hide Other Pairs", style: AppTextstyle.tsRegularSize14),
                ],
              ),
              Container(
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
                  'Cancel all',
                  style: AppTextstyle.tsMediumSize16Black.copyWith(
                    color: AppColor.grayColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),
          if (!_hideOtherPairs) TradeOpenOrderSection(),
        ],
      ),
    );
  }
}
