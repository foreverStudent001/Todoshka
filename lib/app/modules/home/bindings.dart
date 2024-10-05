import 'package:clippy/app/modules/home/controller.dart';
import 'package:clippy/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository()));
  }
}