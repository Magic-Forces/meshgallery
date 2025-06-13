import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'library.trash'.tr()),
      body: Center(child: Text('library.trash'.tr())),
    );
  }
}
