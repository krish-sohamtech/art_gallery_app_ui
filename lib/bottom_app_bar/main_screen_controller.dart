import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final RxInt currentIndex = 0.obs;
void changePage(int index) {
    currentIndex.value = index;
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
 }

 
