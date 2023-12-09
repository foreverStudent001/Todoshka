import 'package:clippy/src/global_things/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//this files contains common properties which can later be used to create new looks elsewhere!
//note: mixin allows for your class to inherit multiple classes (dart by default only allows ur class to inherit one)
mixin SubThemeData{
  TextTheme getTextThemes(){
  return GoogleFonts.quicksandTextTheme(
      const TextTheme(
          bodyLarge: TextStyle(
      fontWeight:FontWeight.w400,
    ),
        bodyMedium: TextStyle(
        fontWeight:FontWeight.w400)
    ));
  }

  //method
  IconThemeData getIconTheme(){
    return const IconThemeData(color:onSurfaceTextColor, size:16);
  }
}