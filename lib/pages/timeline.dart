import 'package:flutter/material.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Timeline"),
      body: Center(child: Text('Timeline')),
    );
  }
}
