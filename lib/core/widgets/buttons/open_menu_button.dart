import 'package:clippy/app/modules/menu/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OpenMenuButton extends StatefulWidget {
  const OpenMenuButton({super.key});

  @override
  State<OpenMenuButton> createState() => _OpemMenuButtonState();
}

class _OpemMenuButtonState extends State<OpenMenuButton> {

  late SMIBool _menuBtn;

  toggleMenu(){
    Get.find<MenuDrawerController>().toggleDrawer();
  }

  void _onMenuIconInit(Artboard artboard) {
    final controller =
    StateMachineController.fromArtboard(artboard, "State Machine");
    artboard.addController(controller!);
    _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
    _menuBtn.value = true;
  }

  void toggleButton() {
    _menuBtn.value = !_menuBtn.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleButton();
        toggleMenu();
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 50,
        width: 50,
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
        child: RiveAnimation.asset(
          "assets/animations/menu_button.riv",
          stateMachines: ['State Machine'],
          animations: ['open', 'close'],
          onInit: _onMenuIconInit,
        ),
      ),
    );
  }
}