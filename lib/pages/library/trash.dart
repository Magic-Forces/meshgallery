import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "library.trash".tr().toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        centerTitle: true,
      ),
      body: Center(child: Text('library.trash'.tr())),
    );
  }
}
