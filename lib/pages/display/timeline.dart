import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meshgallery/widgets/app_bar.dart';
import 'package:meshgallery/pages/display/viewer.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<Medium> mediumList = [];

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  Future<void> loadMedia() async {
    List<Album> albums = await PhotoGallery.listAlbums();
    Album allAlbum = albums.firstWhere(
      (album) => album.name?.toLowerCase() == 'all',
      orElse: () => albums.first,
    );
    MediaPage mediaPage = await allAlbum.listMedia();
    mediumList = mediaPage.items;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "timeline".tr()),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemCount: mediumList.length,
          itemBuilder: (context, index) {
            final medium = mediumList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Viewer(medium: medium),
                  ),
                );
              },
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: ThumbnailProvider(
                  mediumId: medium.id,
                  mediumType: medium.mediumType,
                  highQuality: true,
                ),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
