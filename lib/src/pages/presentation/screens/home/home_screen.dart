import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/cards/question_card.dart';
import '../../../../common_widgets/content_area.dart';
import '../../controllers/question_papers/question_paper_controller.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends GetView<QuestionPaperController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //reference to controller
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: ContentArea(
          addPadding: false,
          child: Obx(() => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            itemCount: questionPaperController.allPapers.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
          //controller contains model which is saved in allPapers. Returns model which we then access in question_card
              return QuestionCard(
                model: questionPaperController.allPapers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
              )),
        ));
  }
}




