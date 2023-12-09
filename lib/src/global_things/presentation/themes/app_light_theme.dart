import 'package:clippy/src/global_things/presentation/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

//need two colors to do linear gradient
//todo:replace these DEFAULT colors with "custom default" pallet
const Color primaryLightColorLight = Color(0xFF125187);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

//use "with" for inheriting properties from a class
class LightTheme with SubThemeData{
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme:getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight
      )
    );
  }
}