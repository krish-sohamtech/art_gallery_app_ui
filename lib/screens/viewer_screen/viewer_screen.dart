import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ViewerPage extends StatelessWidget {
  final Medium medium;

  const ViewerPage(Medium medium, {super.key}) : medium = medium;

  @override
  Widget build(BuildContext context) {
    ThemeController data = Get.put(ThemeController());
    @override
    DateTime? date = medium.creationDate ?? medium.modifiedDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: data.isDarkMode.value
            ? const Color.fromRGBO(22, 20, 20, 1)
            : Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.cherryRed,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  PhotoGallery.deleteMedium(mediumId: medium.id);
                },
                child: const Icon(
                  Icons.delete,
                  color: AppColors.cherryRed,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: AppColors.cherryRed,
            ),
          ),
          PopupMenuButton(
            color: AppColors.cherryRed,
            itemBuilder: (context) => [],
          )
        ],
        title: date != null
            ? Text(
                '${date.day}/${date.month}/${date.year.toString()}',
                style: const TextStyle(color: AppColors.cherryRed),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: medium.mediumType == MediumType.image
              ? GestureDetector(
                  // onTap: () async {
                  //   PhotoGallery.deleteMedium(mediumId: medium.id);
                  // },
                  child: Image(
                    fit: BoxFit.cover,
                    // placeholder: MemoryImage(kTransparentImage),
                    image: PhotoProvider(mediumId: medium.id),
                  ),
                  // child: FadeInImage(
                  //   fit: BoxFit.cover,
                  //   placeholder: MemoryImage(kTransparentImage),
                  //   image: PhotoProvider(mediumId: medium.id),
                  // ),
                )
              : null,
        ),
      ),
    );
  }
}
