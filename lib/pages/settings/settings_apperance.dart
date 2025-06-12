import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsApperance extends StatelessWidget {
  const SettingsApperance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings.appearance".tr().toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        centerTitle: true,
      ),
      body: Center(child: Text('settings.appearance'.tr())),
    );
  }
}
