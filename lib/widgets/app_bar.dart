import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/config/globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meshgallery/utils/toast_util.dart';

import 'package:meshgallery/pages/profile.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, this.title = 'MeshGallery'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Future<void> launchUrlInApp(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.search_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          ToastUtil.showFeatureNotAvailableToast(context);
        },
      ),

      title: GestureDetector(
        onLongPress: () {
          if (title == "timeline".tr()) {
            launchUrlInApp(appRepo);
          }
        },
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.person_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          },
        ),
      ],
    );
  }
}

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SimpleAppBar({super.key, this.title = 'MeshGallery'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      centerTitle: true,
    );
  }
}
