import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';

class ViewerPage extends StatelessWidget {
  final Medium medium;
  const ViewerPage(this.medium, {super.key});

  
  @override
  Widget build(BuildContext context) {
    ThemeController data = Get.put(ThemeController());
    DateTime? date = medium.creationDate ?? medium.modifiedDate;
    return Scaffold(
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: deleteImage, 
              child: Icon(
                Icons.delete,
                color: data.isDarkMode.value
                    ? const Color.fromRGBO(241, 239, 239, 1)
                    : const Color.fromRGBO(1, 1, 1, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: data.isDarkMode.value
                  ? const Color.fromRGBO(241, 239, 239, 1)
                  : const Color.fromRGBO(1, 1, 1, 1),
            ),
          ),
          PopupMenuButton(
            color: data.isDarkMode.value
                ? const Color.fromRGBO(241, 239, 239, 1)
                : const Color.fromRGBO(1, 1, 1, 1),
            itemBuilder: (context) => [],
          )
        ],
        title: date != null
            ? Text(
                '${date.day}/${date.month}/${date.year.toString()}',
                style: TextStyle(
                  color: data.isDarkMode.value
                      ? const Color.fromRGBO(241, 239, 239, 1)
                      : const Color.fromRGBO(1, 1, 1, 1),
                ),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: medium.mediumType == MediumType.image
              ? GestureDetector(
                  child: Image(
                    fit: BoxFit.cover,
                    image: PhotoProvider(mediumId: medium.id),
                  ),
                )
              : null,
        ),
      ),
    );
  }
  void deleteImage() async {

  try {
     await PhotoGallery.deleteMedium(mediumId: medium.id);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Image deleted successfully."),
        ),
      );
      
      // You may also consider returning to the previous screen if needed:
      Navigator.of(Get.context!).pop();
  
  } catch (e) {
    if (kDebugMode) {
      print("Error deleting image: $e");
    }
    // Handle any errors that may occur during deletion.
  }
}
}
