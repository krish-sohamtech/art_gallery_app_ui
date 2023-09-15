import 'package:art_gallery_app_ui/screens/explore/explore_controller.dart';
import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:art_gallery_app_ui/screens/viewer_screen/viewer_screen.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExploreController controller = Get.put(ExploreController());

  @override
  void initState() {
    super.initState();
    controller.loading_.value;
    // _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    List<Album> albums = await PhotoGallery.listAlbums();
    // setState(() {
    // _albums = albums;
    // _loading = false;
    // });
    controller.changeallalbums(albums);
    controller.changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Collection",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${controller.albums_?.length} Albums',
                  style: TextStyle(
                      color: Colors.black87,
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
              child: controller.loading_.value
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
                              ...?controller.albums_?.map(
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

  AlbumPage(Album album, {super.key}) : album = album;

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
    setState(() {
      _media = mediaPage.items;
    });
  }

  ThemeController data = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(15),
          //         bottomRight: Radius.circular(15))),
          backgroundColor: data.isDarkMode.value
              ? Color.fromARGB(255, 22, 20, 20)
              : Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.cherryRed,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.album.name ?? "Unnamed Album",
              style: TextStyle(
                color: AppColors.cherryRed,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: Container(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.5,
              children: <Widget>[
                ...?_media?.map(
                  (medium) => GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ViewerPage(medium)),
                    ),
                    child: Container(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
