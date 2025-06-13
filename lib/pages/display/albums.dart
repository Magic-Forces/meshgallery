import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meshgallery/pages/display/album_page.dart';
import 'package:meshgallery/utils/toast_util.dart';

import 'package:meshgallery/widgets/app_bar.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  void initState() {
    super.initState();
    loadAllAlbums();
  }

  List<Album> albums = [];

  void loadAllAlbums() async {
    albums = await PhotoGallery.listAlbums();
    setState(() {
      albums;
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = (MediaQuery.of(context).size.width - 20) / 3;

    return Scaffold(
      appBar: MyAppBar(title: "albums".tr()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ToastUtil.showFeatureNotAvailableToast(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext ctx, int index) {
            Album album = albums[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumPage(album: album),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AlbumThumbnailProvider(
                          album: album,
                          highQuality: true,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    album.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(album.count.toString()),
                ),
              ],
            );
          },
          itemCount: albums.length,
        ),
      ),
    );
  }
}
