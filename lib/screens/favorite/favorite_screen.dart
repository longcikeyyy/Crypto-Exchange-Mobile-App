import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_textstyle.dart';
import 'package:crypto_exchange_mobile_app/core/extension/context_extension.dart';
import 'package:crypto_exchange_mobile_app/screens/favorite/widget/favorite_cart_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: AppTextstyle.tsMediumSize16Black.copyWith(fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32,
            width: (321 / 375) * context.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Pair\nUSDT",
                  style: AppTextstyle.tsRegularSize14,
                ),
                SizedBox(width: 160),
                Row(
                  children: [
                    Text("Last\nPrice", style: AppTextstyle.tsRegularSize14),
                    SizedBox(width: 16),
                    Text(
                      textAlign: TextAlign.center,
                      "24H\nChange",
                      style: AppTextstyle.tsRegularSize14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: AppColor.dividerColor),
          FavoriteCartItem(),
        ],
      ),
    );
  }
}
