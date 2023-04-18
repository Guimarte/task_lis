import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list/controllers/theme_controller/theme_controller_getx.dart';

class ChangeThemeButton extends StatelessWidget {
  ChangeThemeButton({super.key});

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Switch.adaptive(
        value: themeController.isDarkMode.value,
        onChanged: (value) {
          themeController.isDarkMode.value = !themeController.isDarkMode.value;
          themeController.toogleTheme(value);
        }));
  }
}
