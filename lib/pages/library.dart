import 'package:flutter/material.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Library"),
      body: Center(child: Text('Library')),
    );
  }
}
