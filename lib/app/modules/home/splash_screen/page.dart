import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

class SplashScreenPage extends GetView {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen.callback(
      name: 'assets/animations/splashscreen.riv',
      onSuccess: (data) {
        Get.toNamed('/home');
      },
      onError: (err, stack) {
        //error throw by until callback function
      },
      startAnimation: 'Timeline 1',
      until: () => Future.delayed(const Duration(seconds: 6)),
    );
  }
}
