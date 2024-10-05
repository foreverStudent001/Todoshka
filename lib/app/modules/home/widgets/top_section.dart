import 'package:clippy/app/modules/home/controller.dart';
import 'package:clippy/app/modules/home/widgets/btn_change_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSectionWidget extends GetView<HomeController> {
  const TopSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BtnChangeThemeWidget()
          ],
        ),
      ),
    );
  }
}