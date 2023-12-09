import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/question_papers/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //reference to controller
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body :Obx(()=> ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
              child:SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    image:NetworkImage(_questionPaperController.allPaperImages[index]),
                    placeholder: AssetImage("assets/images/app_splash_logo.png"), //show images from local folder as network images are being loaded
                    //hi
                  )
              )
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const SizedBox(height:20);
        },
        itemCount: _questionPaperController.allPaperImages.length
    )));
  }
}
