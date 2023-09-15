// import 'package:art_gallery_app_ui/screens/home_screen.dart';

import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_app_bar/bottom_navbar.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        theme: themeController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
        home: const BottomNavBar(),
      ),
    );
  }
}
