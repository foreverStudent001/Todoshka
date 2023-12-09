import 'package:clippy/src/global_things/presentation/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';

import '../themes/app_dark_theme.dart';

class ThemeController extends GetxController{
 late ThemeData _darkTheme;
 late ThemeData _lightTheme;

@override
  void onInit(){ //method gets called before app boot up. Pre-initialization
  initializeThemeData();
  super.onInit();
}

//method
initializeThemeData(){
_darkTheme = DarkTheme().buildDarkTheme();
_lightTheme = LightTheme().buildLightTheme();
}

//getters that return theme data
ThemeData get darkTheme => _darkTheme;
ThemeData get lightTheme => _lightTheme;

}