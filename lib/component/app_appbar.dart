import 'package:crypto_exchange_mobile_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;

  const AppAppbar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      leading: leading ?? SizedBox(width: 56), 
      centerTitle: true,
      title: title,
      actions: actions ?? [SizedBox(width: 56)], 
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}