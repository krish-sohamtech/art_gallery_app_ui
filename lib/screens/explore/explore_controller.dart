import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ExploreController extends GetxController {
  List<Medium>? media;
  List<Album>? albums_;

   var loading_ = true.obs;
void changeLoading() {
    loading_.value = false;
  }

  void changeMedia(var allMedia) {
    media = allMedia;
  }
  void changeallalbums(var albums) {
    albums_ = albums;
  }
 }

 