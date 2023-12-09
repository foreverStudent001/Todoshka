import 'package:clippy/src/global_things/presentation/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

//need two colors to do linear gradient
const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    //instantiate object
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme:getIconTheme(),
      textTheme:getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark
      )
    );
  }
}