import 'package:clippy/app/modules/home/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository repository;
  HomeController(this.repository);
  final darkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  changeTheme() {
    Get.changeTheme(darkMode.value ? ThemeData.light() : ThemeData.dark());
    darkMode.value = !darkMode.value;
  }
}