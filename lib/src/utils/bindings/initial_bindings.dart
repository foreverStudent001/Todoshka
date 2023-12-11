import 'package:clippy/src/global_things/application/services/firebase_storage_service.dart';
import 'package:clippy/src/pages/presentation/controllers/auth_controller.dart';
import'package:get/get.dart';
import '../../global_things/presentation/controllers/theme_controller.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies(){
    //inject controllers
    Get.put(AuthController(), permanent: true); //use permanent to keep events in memory
    Get.put(ThemeController());
    Get.put(FirebaseStorageService());
  }
}
