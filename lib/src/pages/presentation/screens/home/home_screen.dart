import 'package:clippy/src/global_things/presentation/themes/app_colors.dart';
import 'package:clippy/src/global_things/presentation/themes/custom_text_styles.dart';
import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/cards/question_card.dart';
import '../../../../common_widgets/content_area.dart';
import '../../../../global_things/presentation/themes/app_icons.dart';
import '../../controllers/question_papers/question_paper_controller.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends GetView<QuestionPaperController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //reference to controller
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),

        child: SafeArea(
          child: Column(
            //top and bottom part of screen
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      AppIcons.menuLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
                          Text(
                            "Please kill me",
                            style: detailText.copyWith(color: onSurfaceTextColor),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "What's up b*tch?",
                      style: headerText,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//note - add scaffold otherwise text has yellow underline
