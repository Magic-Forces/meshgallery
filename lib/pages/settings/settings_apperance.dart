import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class SettingsApperance extends StatelessWidget {
  const SettingsApperance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'settings.appearance'.tr()),
      body: Center(child: Text('settings.appearance'.tr())),
    );
  }
}
