import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  Rx<bool> isDarkMode = true.obs;

  void toogleTheme(bool isOn) {
    themeMode.value = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}
