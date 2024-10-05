import 'package:clippy/app/modules/home/controller.dart';
import 'package:clippy/app/modules/home/widgets/btn_change_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BtnChangeThemeWidget()],
          ),
        ),
      ),
    );
  }
}
