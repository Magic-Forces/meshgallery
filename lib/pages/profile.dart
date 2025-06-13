import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'profile'.tr()),
      body: Center(child: Text('profile'.tr())),
    );
  }
}
