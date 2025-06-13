import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'library.map'.tr()),
      body: Center(child: Text('library.map'.tr())),
    );
  }
}
