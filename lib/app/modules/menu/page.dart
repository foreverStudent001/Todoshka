import 'package:clippy/app/modules/menu/controller.dart';
import 'package:clippy/app/modules/menu/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:moon_design/moon_design.dart';

class MenuDrawer extends GetView<MenuDrawerController> {
  final Widget child;
  const MenuDrawer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: controller.zoomDrawerController,
        style: DrawerStyle.style3,
        mainScreenScale: 0.000001,
        menuScreen: const SideMenu(),
        mainScreen: child,
        menuBackgroundColor: MoonColors.dark.beerus,
        borderRadius: 24.0,
        showShadow: false,
        menuScreenWidth: double.infinity,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}

