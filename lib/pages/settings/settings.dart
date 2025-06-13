import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';
import 'package:meshgallery/widgets/custom_button.dart';

import 'package:meshgallery/pages/settings/settings_advanced.dart';
import 'package:meshgallery/pages/settings/settings_apperance.dart';
import 'package:meshgallery/pages/settings/settings_network.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'settings.settings'.tr()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsApperance(),
                ),
              );
            },
            icon: Icons.palette_outlined,
            text: "settings.appearance".tr(),
          ),
          const SizedBox(height: 12),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsNetwork(),
                ),
              );
            },
            icon: Icons.wifi_outlined,
            text: "settings.network".tr(),
          ),
          const SizedBox(height: 12),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsAdvanced(),
                ),
              );
            },
            icon: Icons.build_outlined,
            text: "settings.advanced".tr(),
          ),
        ],
      ),
    );
  }
}
