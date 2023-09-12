// import 'package:art_gallery_app_ui/screens/home_screen.dart';
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
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
