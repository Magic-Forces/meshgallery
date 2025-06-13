import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class SettingsAdvanced extends StatelessWidget {
  const SettingsAdvanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'settings.advanced'.tr()),
      body: Center(child: Text('settings.advanced'.tr())),
    );
  }
}
