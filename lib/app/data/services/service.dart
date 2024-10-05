import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfigService extends GetxService {
  RxString theme = 'dark_mode'.obs;
  Future<AppConfigService> init() async {

    return this;
  }

  darkMode() => theme;

  changeDarkMode(_) async {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    theme.value = _;
  }
}