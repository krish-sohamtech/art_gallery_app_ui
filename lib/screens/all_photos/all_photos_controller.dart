import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class AllPhotosController extends GetxController {
  List<Medium>? media;
  List<Medium>? albumsMedia;
  List<Album>? albums_;
  RxBool loading_ = true.obs;
void setLoading(bool value) {
    loading_.value = value;
  }

  void setMedia( List<Medium> allMedia) {
    media = allMedia;
  }
  void seAlbumsMedia( List<Medium> albumsMedia) {
    albumsMedia = albumsMedia;
  }
  
  void setAllAlbums(List<Album> albums) {
    albums_ = albums;
  }
 }
 