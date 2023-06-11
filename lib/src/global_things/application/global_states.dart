import 'package:flutter/material.dart';

class GlobalStates{
  ThemeMode themeMode;

  GlobalStates({required this.themeMode});
}

class InitStates extends GlobalStates{
  InitStates(): super(themeMode: ThemeMode.system);
}