import 'package:flutter/material.dart';
import 'package:meshgallery/pages/display/viewer.dart';
import 'package:meshgallery/widgets/app_bar.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumPage extends StatefulWidget {
  final Album album;
  const AlbumPage({super.key, required this.album});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  List<Medium> mediumList = [];

  Future<void> loadMedia() async {
    MediaPage mediaPage = await widget.album.listMedia();
    mediumList = mediaPage.items;
    setState(() {
      mediumList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = (MediaQuery.of(context).size.width - 25) / 4;

    return Scaffold(
      appBar: SimpleAppBar(title: widget.album.name.toString()),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext ctx, int index) {
            Medium medium = mediumList[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewer(medium: medium),
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
                        image: ThumbnailProvider(
                          mediumId: medium.id,
                          mediumType: medium.mediumType,
                          highQuality: true,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: mediumList.length,
        ),
      ),
    );
  }
}
