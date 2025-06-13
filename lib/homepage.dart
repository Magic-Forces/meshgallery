import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:meshgallery/pages/display/timeline.dart';
import 'package:meshgallery/pages/display/albums.dart';
import 'package:meshgallery/pages/library/library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  late PageController _pageController;

  late final List<Widget> _screens = const [Timeline(), Albums(), Library()];

  late final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: const Icon(Icons.photo_outlined),
      selectedIcon: const Icon(Icons.photo),
      label: "timeline".tr(),
    ),
    NavigationDestination(
      icon: const Icon(Icons.photo_album_outlined),
      selectedIcon: const Icon(Icons.photo_album),
      label: "albums".tr(),
    ),
    NavigationDestination(
      icon: const Icon(Icons.auto_awesome_mosaic_outlined),
      selectedIcon: const Icon(Icons.auto_awesome_mosaic),
      label: "library.library".tr(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _onDestinationSelected(int index) {
    setState(() {
      pageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: pageIndex == 0,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop && pageIndex != 0) {
          _onDestinationSelected(0);
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _screens,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: _destinations,
          onDestinationSelected: _onDestinationSelected,
          selectedIndex: pageIndex,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
        ),
      ),
    );
  }
}
