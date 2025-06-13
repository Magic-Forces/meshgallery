import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class SettingsNetwork extends StatelessWidget {
  const SettingsNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'settings.network'.tr()),
      body: Center(child: Text('settings.network'.tr())),
    );
  }
}
