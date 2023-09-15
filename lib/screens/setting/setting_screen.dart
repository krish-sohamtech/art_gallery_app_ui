import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => SwitchListTile(
              title: Text(themeController.isDarkMode.value
                  ? 'Dark Theme'
                  : 'Light Theme'),
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
