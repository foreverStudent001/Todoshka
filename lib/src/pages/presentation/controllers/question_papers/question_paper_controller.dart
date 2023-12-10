import 'package:clippy/src/global_things/application/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  //declare vars
  final allPaperImages = <String>[].obs; //list is reactive

  @override
  //method called right after app gets booted up
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e); //'e' for error
    }
  }
}
