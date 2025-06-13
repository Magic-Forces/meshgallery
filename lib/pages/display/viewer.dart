import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meshgallery/widgets/app_bar.dart';
import 'package:photo_gallery/photo_gallery.dart';

class Viewer extends StatefulWidget {
  final Medium medium;
  const Viewer({super.key, required this.medium});

  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  @override
  void initState() {
    super.initState();
    loadImageFile();
  }

  File? imageFile;
  void loadImageFile() async {
    imageFile = await widget.medium.getFile();
    setState(() {
      imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: widget.medium.filename.toString()),
      body: Center(
        child: imageFile != null ? Image.file(imageFile!) : Container(),
      ),
    );
  }
}
