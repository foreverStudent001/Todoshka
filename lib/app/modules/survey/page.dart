import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy/app/modules/survey/controller.dart';
import 'package:clippy/app/modules/survey/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_design/moon_design.dart';

class SurveyPage extends GetView<SurveyController> {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Obx(
            () => AnimatedScale(
              scale:
                  controller.questions.length == controller.userAnswers.length
                      ? 1
                      : 0,
              duration: const Duration(milliseconds: 300),
              child: MoonFilledButton(
                onTap: () => controller.save(),
                buttonSize: MoonButtonSize.lg,
                label: const Text("Save"),
                trailing: const Icon(MoonIcons.arrows_right_24_regular),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: (MediaQuery.of(context).size.width),
                  child: Obx(
                    () => RotatedBox(
                      quarterTurns: 1,
                      child: MoonDotIndicator(
                        dotCount: controller.questions.length,
                        selectedDot: controller.currentCard.value,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Obx(() => CarouselSlider(
                    items: [
                      for (var item in controller.questions)
                        QuestionCard(
                          question: item,
                          userAnswers: controller.userAnswers,
                          answer: controller.answer,
                        )
                    ],
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2.8,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (index, reason) {
                          controller.changeCurrentPage(index);
                        }),
                  ),)
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
