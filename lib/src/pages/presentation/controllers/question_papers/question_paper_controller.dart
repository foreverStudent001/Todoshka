import 'package:clippy/src/global_things/application/services/firebase_storage_service.dart';
import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../data/firebase_ref/references.dart';

class QuestionPaperController extends GetxController {
  //declare vars
  final allPaperImages = <String>[].obs; //list is reactive
  final allPapers =<QuestionPaperModel>[].obs;

  @override
  //method called right after app gets booted up
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      //get data from collection in questionPaperRF and save to data
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      //return list of questionPaper
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList(); //.fromSnapshot method returns object
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
       paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList); //no chance for duplication
    } catch (e) {
      print(e); //'e' for error
    }
  }
}
