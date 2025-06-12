import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:meshgallery/widgets/app_bar.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "albums".tr()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text('albums'.tr())),
    );
  }
}
