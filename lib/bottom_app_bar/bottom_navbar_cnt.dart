import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
 


}
