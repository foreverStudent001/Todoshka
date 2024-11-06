import 'package:clippy/app/modules/menu/controller.dart';
import 'package:clippy/app/modules/menu/repository.dart';
import 'package:get/get.dart';

class MenuBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MenuDrawerController>(() => MenuDrawerController(MenuRepository()));
  }
}