import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:meshgallery/widgets/app_bar.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "timeline".tr()),
      body: Center(child: Text('timeline'.tr())),
    );
  }
}
