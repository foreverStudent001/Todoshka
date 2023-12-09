import 'package:flutter/material.dart';

class UIParameters{
  //check whether in dark or light mode
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}