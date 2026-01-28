import 'package:crypto_exchange_mobile_app/providers/theme_provider.dart';
import 'package:crypto_exchange_mobile_app/screens/setting/widgets/setting_section_item_widget.dart';
import 'package:crypto_exchange_mobile_app/screens/setting/widgets/setting_user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        actions: [Icon(Icons.search), SizedBox(width: 15)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingUserInfoWidget(),
              SizedBox(height: 16),
              SettingSectionItemWidget(
                title: "Privacy",
                items: [
                  SettingSectionItem(iconData: Icons.person, name: "Profile"),
                  SettingSectionItem(
                    iconData: Icons.security,
                    name: "Security",
                  ),
                ],
              ),
              SizedBox(height: 14),
              SettingSectionItemWidget(
                title: "Finance",
                items: [
                  SettingSectionItem(iconData: Icons.person, name: "History"),
                  SettingSectionItem(iconData: Icons.security, name: "Limite"),
                ],
              ),
              SizedBox(height: 14),
              SettingSectionItemWidget(
                title: "Account",
                items: [
                  SettingSectionItem(
                    iconData: Icons.person,
                    name: "Themes",
                    endWidget: Row(
                      children: [
                        Text("Dark Mode"),
                        SizedBox(width: 14),
                        Switch(
                          value: context.watch<ThemeProvider>().isDarkMode,
                          onChanged: (value) {
                            context.read<ThemeProvider>().toggleThemeMode();
                          },
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  SettingSectionItem(
                    iconData: Icons.security,
                    name: "Notifications",
                  ),
                ],
              ),
              SizedBox(height: 14),
              SettingSectionItemWidget(
                title: "Finance",
                items: [
                  SettingSectionItem(iconData: Icons.person, name: "History"),
                  SettingSectionItem(iconData: Icons.security, name: "Limite"),
                  SettingSectionItem(iconData: Icons.security, name: "Limite"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
