import 'package:clippy/app/modules/menu/repository.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MenuDrawerController extends GetxController with StateMixin {
  final MenuRepository repository;

  MenuDrawerController(this.repository);

  final zoomDrawerController = ZoomDrawerController();
  final x = 0.01.obs;

  void toggleDrawer() {
    print("Toggle drawer");

    zoomDrawerController.toggle?.call();

    if(x.value == 0.01){
      x.value = 0.2;
    }else{
      x.value = 0.01;
    }

    update();
  }
}