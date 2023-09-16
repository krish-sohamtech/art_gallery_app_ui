// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:io';
import 'package:art_gallery_app_ui/screens/all_photos/all_photos_controller.dart';
import 'package:art_gallery_app_ui/screens/viewer_screen/viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AllPhotosScreen extends StatefulWidget {
  const AllPhotosScreen({super.key});

  @override
  _AllPhotosScreenState createState() => _AllPhotosScreenState();
}

class _AllPhotosScreenState extends State<AllPhotosScreen> {
  AllPhotosController controller = Get.put(AllPhotosController());

  @override
  void initState() {
    super.initState();
    controller.loading_.value;
    initAsync();
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums = await PhotoGallery.listAlbums();
      List<Medium> allMedia = [];
      for (var album in albums) {
        MediaPage mediaPage = await album.listMedia();
        allMedia.addAll(mediaPage.items);
      }

      controller.setLoading(false);
      controller.setMedia(allMedia);
    } else {
      controller.setLoading(false);
    }
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted &&
              await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Photos",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ])),
          Expanded(
            child: Obx(
              () => Center(
                child: controller.loading_.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: Container(
                          color: const Color.fromRGBO(240, 238, 238, 1),
                          child: Column(
                            children: [
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double gridWidth =
                                        (constraints.maxWidth - 20) / 3;
                                    double gridHeight = gridWidth + 33;
                                    // ignore: unused_local_variable
                                    double ratio = gridWidth / gridHeight;
                                    return GridView.count(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2.0,
                                      crossAxisSpacing: 2.5,
                                      children: <Widget>[
                                        ...?controller.media?.map(
                                          (medium) => GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewerPage(medium)),
                                            ),
                                            child: Container(
                                              color: Colors.black,
                                              child: FadeInImage(
                                                fit: BoxFit.cover,
                                                placeholder: MemoryImage(
                                                    kTransparentImage),
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
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
