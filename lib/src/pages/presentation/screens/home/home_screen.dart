import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/cards/question_card.dart';
import '../../controllers/question_papers/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //reference to controller
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
            body: Obx(() => ListView.separated(
                padding: UIParameters.mobileScreenPadding,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  //controller contains model which is saved in allPapers. Returns model which we then access in question_card
                  return QuestionCard(
                    model: _questionPaperController.allPapers[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemCount: _questionPaperController.allPapers.length)), //
        );
  }
}
