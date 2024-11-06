import 'package:clippy/app/modules/survey/controller.dart';
import 'package:clippy/app/modules/survey/repository.dart';
import 'package:get/get.dart';

class SurveyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyController>(() => SurveyController(SurveyRepository()));
  }
}