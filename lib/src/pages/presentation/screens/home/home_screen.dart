import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/question_papers/question_paper_controller.dart';
import 'package:clippy/src/global_things/application/services/firebase_storage_service.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //reference to controller
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Obx(() => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: FadeInImage(
                        image: NetworkImage(
                            _questionPaperController.allPaperImages[index]),
                        placeholder: AssetImage(
                            "assets/images1/app_splash_logo.png"), //show images from local folder as network images are being loaded
                      )));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPaperImages.length)));
  }
}
