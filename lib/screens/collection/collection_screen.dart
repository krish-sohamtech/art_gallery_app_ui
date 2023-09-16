import 'package:art_gallery_app_ui/screens/all_photos/all_photos_controller.dart';
import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:art_gallery_app_ui/screens/viewer_screen/viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  AllPhotosController photosController = Get.put(AllPhotosController());

  @override
  void initState() {
    super.initState();
    if (photosController.loading_.value) {
      initAsync();
    }
  }

  Future<void> initAsync() async {
    List<Album> albums = await PhotoGallery.listAlbums();

    photosController.setAllAlbums(albums);
    photosController.setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Collection",
                  style: TextStyle(
                      color: themeController.isDarkMode.value
                          ? const Color.fromRGBO(241, 239, 239, 1)
                          : const Color.fromRGBO(1, 1, 1, 1),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${photosController.albums_?.length} Albums',
                  style: TextStyle(
                      color: themeController.isDarkMode.value
                          ? const Color.fromRGBO(241, 239, 239, 1)
                          : const Color.fromRGBO(1, 1, 1, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: Obx(
            () => Center(
              child: photosController.loading_.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        double gridWidth = (constraints.maxWidth - 20) / 3;
                        double gridHeight = gridWidth + 40;
                        double ratio = gridWidth / gridHeight;
                        return Container(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: GridView.count(
                            childAspectRatio: ratio,
                            crossAxisCount: 3,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                            children: <Widget>[
                              ...?photosController.albums_?.map(
                                (album) => GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AlbumPage(album)),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Container(
                                          color: Colors.grey[300],
                                          height: gridWidth,
                                          width: gridWidth,
                                          child: FadeInImage(
                                            fit: BoxFit.cover,
                                            placeholder:
                                                MemoryImage(kTransparentImage),
                                            image: AlbumThumbnailProvider(
                                              album: album,
                                              highQuality: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Text(
                                          album.name ?? "Unnamed Album",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            height: 1.2,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Text(
                                          '${album.count.toString()} items',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            height: 1.2,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumPage extends StatefulWidget {
  final Album album;

  const AlbumPage(this.album, {super.key});

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? _media;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    MediaPage mediaPage = await widget.album.listMedia();
     AllPhotosController().setMedia(mediaPage.items);
  }

  ThemeController data = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: data.isDarkMode.value
              ? const Color.fromRGBO(22, 20, 20, 1)
              : Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: data.isDarkMode.value
                  ? const Color.fromRGBO(241, 239, 239, 1)
                  : const Color.fromRGBO(1, 1, 1, 1),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.album.name ?? "Unnamed Album",
              style: TextStyle(
                color: data.isDarkMode.value
                    ? const Color.fromRGBO(241, 239, 239, 1)
                    : const Color.fromRGBO(1, 1, 1, 1),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.5,
            children: <Widget>[
              ...?_media?.map(
                (medium) => GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewerPage(medium)),
                  ),
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: ThumbnailProvider(
                      mediumId: medium.id,
                      mediumType: medium.mediumType,
                      highQuality: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
