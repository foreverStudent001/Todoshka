import 'package:clippy/src/global_things/presentation/themes/app_dark_theme.dart';
import 'package:clippy/src/global_things/presentation/themes/app_light_theme.dart';
import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ]
);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark
    ]
);

//check what mode we are in so we can directly call it
LinearGradient mainGradient()=>
    UIParameters.isDarkMode()? mainGradientDark : mainGradientLight;

