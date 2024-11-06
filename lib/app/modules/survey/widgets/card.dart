import 'package:clippy/app/modules/survey/controller.dart';
import 'package:clippy/core/values/moon_typography_page_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_design/moon_design.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final RxMap userAnswers;
  final Function answer;

  const QuestionCard(
      {super.key,
      required this.question,
      required this.userAnswers,
      required this.answer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(30.0),
        height: 400,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 15))
        ]),
        child: Card(
          color: MoonColors.light.goku,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 30),
                  child: Text(
                    question.question,
                    style: getBodyTextStyle(
                      context,
                      MoonTextSize.values[9],
                    ),
                  ),
                ),
                for (var item in question.answers)
                  MoonMenuItem(
                    absorbGestures: true,
                    onTap: () => {
                    answer(question, item.id, question.answersType)
                    },
                    label: Text(
                      item.text,
                      style: TextStyle(
                          fontSize:
                              context.moonTypography!.body.text18.fontSize),
                    ),
                    trailing: question.answersType == 'radio'
                        ? Obx(() => MoonRadio(
                              value: userAnswers.containsKey(question.id)
                                  ? userAnswers[question.id]?.answerId : null,
                              groupValue:item.id,
                              tapAreaSizeValue: 0,
                              onChanged: (_) {
                                print(_);
                                answer(question.id, _ , 'radio');
                              },
                            ))
                        : Obx(() => MoonCheckbox(
                            value: userAnswers.containsKey(question.id)
                                ? userAnswers[question.id]?.answerId.contains(item.id)
                                : false,
                            onChanged: (_) {
                              print(_);
                              answer(question.id, _ , 'checkbox');
                            })),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
