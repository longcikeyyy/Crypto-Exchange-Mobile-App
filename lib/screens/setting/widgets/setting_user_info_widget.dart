import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:crypto_exchange_mobile_app/core/constant/app_path.dart';
import 'package:flutter/material.dart';

class SettingUserInfoWidget extends StatelessWidget {
  const SettingUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            spreadRadius: 0,
            blurRadius: 4,
            color: Color(0xFF2F66F6).withValues(alpha: 0.12),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(AppPath.icCoin),
                  SizedBox(width: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Dmutro\n",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                          ),
                        ),
                        TextSpan(
                          text: "to***@***.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "ID 28954761",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.copy, size: 20),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFCDFFC5),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                Icon(Icons.verified, color: Color(0xFF00A82D)),
                SizedBox(width: 4),
                Text(
                  "Verified",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF00A82D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
