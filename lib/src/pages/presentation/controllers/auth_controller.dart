import 'package:get/get.dart';
class AuthController extends GetxController{ //the controller we inject into initial_bindings
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  void initAuth() async{
    await Future.delayed(const Duration(seconds:2)); //wait two seconds
    navigateToIntroduction();
  }

//go to new page
void navigateToIntroduction(){
    Get.offAllNamed("/introduction"); //route pointing to the mentioned screen
}
}