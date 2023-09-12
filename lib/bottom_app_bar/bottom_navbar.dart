// Import the floating_bottom_bar package

// ...

import 'package:art_gallery_app_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'bottom_navbar_cnt.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = [
    const HomePage(),
    // const ServerScreen(),
    // Other pages you may want to include
  ];
  final BottomNavController _controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Center(
          child: pages[_controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(initialIndex: 1),
        bottomBar: [
          BottomBarItem(
            icon: const Icon(Icons.explore_outlined, size: 25),
            iconSelected: const Icon(Icons.explore_outlined,
                color: AppColors.cherryRed, size: 25),
            title: 'home',
            dotColor: AppColors.cherryRed,
            onTap: (value) {},
          ),
          BottomBarItem(
            icon: const Icon(Icons.border_all_rounded, size: 25),
            iconSelected: const Icon(Icons.border_all_rounded,
                color: AppColors.cherryRed, size: 25),
            title: 'home',
            dotColor: AppColors.cherryRed,
            onTap: (value) {},
          ),
          BottomBarItem(
            icon: const Icon(Icons.edit, size: 25),
            iconSelected:
                const Icon(Icons.edit, color: AppColors.cherryRed, size: 25),
            title: 'home',
            dotColor: AppColors.cherryRed,
            onTap: (value) {},
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_2_outlined, size: 25),
            iconSelected: const Icon(Icons.person_2_outlined,
                color: AppColors.cherryRed, size: 25),
            title: 'search',
            dotColor: AppColors.cherryRed,
            onTap: (value) {},
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
