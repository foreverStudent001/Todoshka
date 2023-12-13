import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController{
  //instantiate zoom drawer controller
  final zoomDrawerController = ZoomDrawerController();

  //method for button click
  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

}