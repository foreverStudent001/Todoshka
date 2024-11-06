import 'package:clippy/app/modules/home/repository.dart';
import 'package:clippy/core/theme/app_theme.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository repository;
  HomeController(this.repository);
  final darkMode = false.obs;
  final showMenu = true.obs;
  final scale = 1.0.obs;

  press(){
    print('tap');
  }

  changeTheme() {
    Get.changeTheme(darkMode.value ? lightMoon : darkMoon);
    darkMode.value = !darkMode.value;
  }
}