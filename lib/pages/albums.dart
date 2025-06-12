import 'package:flutter/material.dart';
import 'package:meshgallery/widgets/app_bar.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Albums"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(child: Text('Albums')),
    );
  }
}
