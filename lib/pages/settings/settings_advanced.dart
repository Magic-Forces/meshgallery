import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsAdvanced extends StatelessWidget {
  const SettingsAdvanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings.advanced".tr().toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        centerTitle: true,
      ),
      body: Center(child: Text('settings.advanced'.tr())),
    );
  }
}
