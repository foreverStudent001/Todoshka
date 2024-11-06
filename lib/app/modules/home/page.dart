import 'package:clippy/app/modules/home/controller.dart';
import 'package:clippy/app/modules/home/widgets/btn_change_theme.dart';
import 'package:clippy/app/modules/menu/controller.dart';
import 'package:clippy/app/modules/menu/page.dart';
import 'package:clippy/core/widgets/buttons/open_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_design/moon_design.dart';

import '../../../core/widgets/animations/bouncing.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  void showMenuButton(context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Obx(() => AnimatedPositioned(
          top: MediaQuery.of(context).size.height * 0.01,
          left: MediaQuery.of(context).size.height * Get.find<MenuDrawerController>().x.value,
          duration: const Duration(milliseconds: 250),
          child: const SafeArea(child: OpenMenuButton())
      )),
    );

    // Insert the overlay entry into the Overlay
    overlay.insert(overlayEntry);
  }
  @override

  Widget build(BuildContext context) {
    if(controller.showMenu.value){
      Future.delayed(Duration(milliseconds: 100), () {
        showMenuButton(context);
      });
      controller.showMenu.value = false;
    }
    return MenuDrawer(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: Bouncing(
            onPressed: () {

            },
            child: MoonOutlinedButton(
              onTap: () {
                controller.press();
              },
              buttonSize: MoonButtonSize.xl,
              showPulseEffect: true,
              borderColor: MoonColors.light.piccolo,
              borderRadius: BorderRadius.circular(50),
              trailing: const Icon(
                  Icons.add,
                  size: 30,
                  weight: 300
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      color: context.theme.primaryColor,
                      offset: const Offset(0.1, 0.1))
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
            child: Center(
             /* child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [BtnChangeThemeWidget()],
              ),*/
            ),
          ),
          ]
        ),
      ),
    );
  }
}