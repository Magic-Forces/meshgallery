import 'package:flutter/material.dart';
import 'package:meshgallery/utils/toast_util.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, this.title = 'Meshgallery'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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

      title: Text(
        title.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
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
            ToastUtil.showFeatureNotAvailableToast(context);
          },
        ),
      ],
    );
  }
}
