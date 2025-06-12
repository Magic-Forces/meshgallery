import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "library.map".tr().toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        centerTitle: true,
      ),
      body: Center(child: Text('library.map'.tr())),
    );
  }
}
