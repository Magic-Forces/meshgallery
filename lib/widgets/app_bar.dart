import 'package:flutter/material.dart';
import 'package:meshgallery/pages/settings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, this.title = 'Meshgallery'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            );
          },
        ),
      ],
    );
  }
}
