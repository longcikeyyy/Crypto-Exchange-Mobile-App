import 'package:crypto_exchange_mobile_app/component/app_appbar.dart';
import 'package:crypto_exchange_mobile_app/component/app_coincard_market.dart';
import 'package:crypto_exchange_mobile_app/component/app_coincard_portfolio.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/providers/coin_provider.dart';
import 'package:crypto_exchange_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Building HomeScreen");
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppAppbar(
        title: Image.asset(AppPath.imgCoinmoney),
        leading: Icon(Icons.person),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settingScreen);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Portfolio Balance",
                style: AppTextstyle.tsMediumSize16Black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "\$2760.23",
              style: AppTextstyle.tsSemiboldSize32.copyWith(
                color: AppColor.textColor,
              ),
            ),
            SizedBox(height: 4),
            Text("+2.60%", style: AppTextstyle.tsMediumSize16Black),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Image.asset(AppPath.imgChartInBody)],
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Market Movers",
                    style: AppTextstyle.tsMediumSize16Black,
                  ),
                  Text("More", style: AppTextstyle.tsMediumSize16Blue),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<CoinProvider>(
                builder: (context, coinProvider, _) {
                  if (coinProvider.coinInfo == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        coinProvider.coinInfo!.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: AppCoinCardMarket(
                            coin: coinProvider.coinInfo![index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Portfolio", style: AppTextstyle.tsMediumSize16Black),
                  Text("More", style: AppTextstyle.tsMediumSize16Blue),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<CoinProvider>(
                builder: (context, coinProvider, _) {
                  if (coinProvider.coinInfo == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        coinProvider.coinInfo!.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: AppCoinCardPortfolio(
                            coin: coinProvider.coinInfo![index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
