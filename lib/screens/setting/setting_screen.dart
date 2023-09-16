import 'package:art_gallery_app_ui/screens/setting/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController themeController = Get.find();

   SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Setting",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
          const Divider(),
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('On'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle notification settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy'),
            subtitle: const Text('Public'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle privacy settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Save'),
            subtitle: const Text('Phone'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle privacy settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Location'),
            subtitle: const Text('India'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle privacy settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Premium'),
            subtitle: const Text('Free'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle privacy settings
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('FeedBack'),
            subtitle: const Text('★★★☆☆'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Handle privacy settings
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
