import 'package:art_gallery_app_ui/screens/explore/explore_screen.dart';
import 'package:art_gallery_app_ui/screens/folder/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import '../screens/home/global_screen.dart';
import '../screens/setting/setting_screen.dart';
import 'bottom_navbar_cnt.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = [
    const ExploreScreen(),
    const HomePage(),
    const GlobalPage(),
    SettingsPage(),


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
          child: const Icon(Icons.add),
          backgroundColor: AppColors.cherryRed,
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
