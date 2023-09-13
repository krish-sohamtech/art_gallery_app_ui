import 'package:art_gallery_app_ui/screens/explore/explore_screen.dart';
import 'package:art_gallery_app_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import '../screens/global_screen.dart';
import 'bottom_navbar_cnt.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = [
    ExploreScreen(),
    const HomePage(),
    const GlobalPage(),

    // Other pages you may want to include
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
      bottomNavigationBar: AnimatedBottomNavigationBar(
        controller: FloatingBottomBarController(initialIndex: 0),
        bottomBar: [
          BottomBarItem(
            icon: const Icon(Icons.explore_outlined, size: 25),
            iconSelected: const Icon(Icons.explore_outlined,
                color: AppColors.cherryRed, size: 25),
            title: 'Photos',
            dotColor: AppColors.cherryRed,
            onTap: (value) {
              controller.changePage(0);
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.border_all_rounded, size: 25),
            iconSelected: const Icon(Icons.border_all_rounded,
                color: AppColors.cherryRed, size: 25),
            title: 'Folder',
            dotColor: AppColors.cherryRed,
            onTap: (value) {
              controller.changePage(1);
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.gps_fixed_rounded, size: 25),
            iconSelected: const Icon(Icons.gps_fixed_rounded,
                color: AppColors.cherryRed, size: 25),
            title: 'Global',
            dotColor: AppColors.cherryRed,
            onTap: (value) {
              controller.changePage(2);
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_2_outlined, size: 25),
            iconSelected: const Icon(Icons.person_2_outlined,
                color: AppColors.cherryRed, size: 25),
            title: 'search',
            dotColor: AppColors.cherryRed,
            onTap: (value) {
              controller.changePage(3);
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: AppColors.cherryRed,
          centerIcon: const FloatingCenterButton(
            
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [],
        ),
      ),
    ));
  }
}
