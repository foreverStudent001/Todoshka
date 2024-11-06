import 'package:clippy/app/modules/survey/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_design/moon_design.dart';

class SurveyController extends GetxController with StateMixin {
  final SurveyRepository repository;

  SurveyController(this.repository);

  final currentCard = 0.obs;

  late RxList<Question> questions = [
    Question(
        id: 1,
        question: "What theme would you like?",
        answersType: "radio",
        answers: [
          Answer(id: 1, text: "Minimalism"),
          Answer(id: 2, text: "Drawn"),
          Answer(id: 3, text: "Glass"),
        ]),
    Question(
        id: 2,
        question: "What will you use the app for?",
        answersType: "checkbox",
        answers: [
          Answer(id: 4, text: "Education"),
          Answer(id: 5, text: "Work"),
          Answer(id: 6, text: "Art"),
        ]),
    Question(
        id: 3,
        question: "Test -> disabled if Minimalism",
        answersType: "checkbox",
        answers: [
          Answer(id: 4, text: "Test 1"),
          Answer(id: 5, text: "Test 2"),
          Answer(id: 6, text: "Test 3"),
        ]),
  ].obs;
  late RxList<Question> questionsCopy = [...questions].obs;
  final RxMap userAnswers = {}.obs;
  late Widget saveButton = const Text('');
  changeCurrentPage(index) {
    currentCard.value = index;
  }

  showButton(){
    saveButton = questions.length == userAnswers.length ? const MoonFilledButton(
      buttonSize: MoonButtonSize.lg,
      label: Text("Save"),
      trailing: Icon(MoonIcons.arrows_right_24_regular),
    ) : const Text('');
  }

  filterQuestion() {
    questions.assignAll(questionsCopy.where((element) => checkAnswers(element) ));
    questions.refresh();
  }

  checkAnswers(element){
    if(userAnswers.containsKey(1)){
      if(userAnswers[1].answerId == 1){
        return element.id != 3;
      }
    }
    return true;
  }

  save(){
    Get.toNamed('/home');
  }

  answer(Question question, int answerId, String answerType) {
    if (answerType == 'radio') {
      userAnswers[question.id] =
          UserAnswer(questionId: question.id, answerId: answerId);
    }

    if (answerType == 'checkbox') {
      if (userAnswers[question.id]?.answerId != null) {
        bool isExists = false;
        userAnswers[question.id].answerId.forEach((element) {
          if (element == answerId) isExists = true;
        });
        if (isExists) {
          userAnswers[question.id].answerId.remove(answerId);
        } else {
          userAnswers[question.id].answerId.add(answerId);
        }
      } else {
        userAnswers[question.id] =
            UserAnswer(questionId: question.id, answerId: {answerId});
      }
    }
    showButton();
    userAnswers.refresh();
    filterQuestion();
  }
}

class Question {
  late int id;
  late String question;
  late String answersType;
  late List<Answer> answers;

  Question(
      {required this.id,
      required this.question,
      required this.answersType,
      required this.answers});
}

class Answer {
  late int id;
  late String text;

  Answer({required this.id, required this.text});
}

class UserAnswer {
  late int questionId;
  late dynamic answerId;

  UserAnswer({required this.questionId, required this.answerId});
}
