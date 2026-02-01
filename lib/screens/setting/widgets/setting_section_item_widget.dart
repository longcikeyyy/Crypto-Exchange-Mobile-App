import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class SettingSectionItem {
  final IconData iconData;
  final String name;
  final Widget? endWidget;

  SettingSectionItem({
    required this.iconData,
    required this.name,
    this.endWidget,
  });
}

class SettingSectionItemWidget extends StatelessWidget {
  final String title;
  final List<SettingSectionItem> items;

  const SettingSectionItemWidget({
    super.key,
    required this.title,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.greyColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 14),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = items[index];
              return SizedBox(
                height: 31,
                child: Row(
                  children: [
                    Icon(item.iconData, size: 24),
                    SizedBox(width: 4),
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ),
                    const Spacer(),
                    if (item.endWidget == null)
                      Icon(Icons.arrow_forward_ios, size: 16),
                    if (item.endWidget != null) item.endWidget!,
                    SizedBox(width: 14),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 28),
              child: Divider(height: 1, color: AppColor.dividerColor),
            ),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
