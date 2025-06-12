import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/widgets/app_bar.dart';
import 'package:meshgallery/widgets/custom_button.dart';

import 'package:meshgallery/pages/library/map.dart';
import 'package:meshgallery/pages/library/trash.dart';
import 'package:meshgallery/pages/settings/settings.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "library.library".tr()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Map()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/globe.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Trash()),
              );
            },
            icon: Icons.delete,
            text: "library.trash".tr(),
            iconBackgroundColor: Colors.red,
            iconColor: Colors.white,
          ),
          const SizedBox(height: 12),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            icon: Icons.settings,
            text: "settings.settings".tr(),
          ),
        ],
      ),
    );
  }
}
