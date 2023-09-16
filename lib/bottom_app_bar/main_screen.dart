import 'package:art_gallery_app_ui/screens/all_photos/all_photos_screen.dart';
import 'package:art_gallery_app_ui/screens/collection/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import '../screens/global/global_screen.dart';
import '../screens/setting/setting_screen.dart';
import 'main_screen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = [
    const AllPhotosScreen(),
    const Collection(),
    const GlobalPage(),
     const SettingScreen(),
     
  ];
  BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Center(
            child: pages.elementAt(controller.currentIndex.value),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your action for the floating action button here
          },
          backgroundColor: AppColors.cherryRed,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.explore_outlined),
                    onPressed: () {
                      controller.changePage(0);
                    },
                    color: controller.currentIndex.value == 0
                        ? AppColors.cherryRed // Set the selected color here
                        : AppColors.black, //  // Set the unselected color here
                  ),
                  IconButton(
                    icon: const Icon(Icons.border_all_rounded),
                    onPressed: () {
                      controller.changePage(1);
                    },
                    color: controller.currentIndex.value == 1
                        ? AppColors.cherryRed // Set the selected color here
                        : AppColors.black, // Set the unselected color here
                  ),
                  IconButton(
                    icon: const Icon(Icons.gps_fixed_rounded),
                    onPressed: () {
                      controller.changePage(2);
                    },
                    color: controller.currentIndex.value == 2
                        ? AppColors.cherryRed // Set the selected color here
                        : AppColors.black, //  // Set the unselected color here
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_2_outlined),
                    onPressed: () {
                      controller.changePage(3);
                    },
                    color: controller.currentIndex.value == 3
                        ? AppColors.cherryRed // Set the selected color here
                        : AppColors.black, // Set the unselected color here
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
