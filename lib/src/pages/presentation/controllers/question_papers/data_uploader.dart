import 'package:clippy/src/pages/data/firebase_ref/references.dart';
import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../../../data/firebase_ref/loading_status.dart';
import '../../../data/firebase_ref/references.dart';

//todo: should this be put under data folder?
//DataUploader controller class. Called when app starts
//admin use, todo: implement in UI
class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData(); //method ideal for (for example) - uploading file only once or only at boot up
    super
        .onReady(); //upload data to firebase backend, only gets data when called
  }

  //declare and get enum value from loading_status
  final loadingStatus = LoadingStatus.loading.obs; //use obs to make variable observable/reactive

//body of uploadData method
  Future<void> uploadData() async { //oc: loadingStatus is obs
    loadingStatus.value = LoadingStatus.loading; //0
    final fireStore = FirebaseFirestore.instance;
    //declare variable to hold asset loaded
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    //declare variable for decode assets
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //look into specific items in assets, not search through all of them
    //So, get keys (refers to path) + only look for json in this path, then convert from map to list to make it indexable
    //oc: load json file and print path
    final papersInAssets = manifestMap.keys //save to variable
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPapers = [];

    //read content
    for (var paper in papersInAssets) {
      //note: each path is store in paper var
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(
          stringPaperContent))); //jsonDecode takes string, converts to map
    }
    //print('Items number ${questionPapers[0].id}');

    //upload multiple data to backend
    var batch = fireStore.batch();

    //create doc + for each doc create fields
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        //access document in firestore collection
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null
            ? 0
            : paper.questions!
                .length //check if list is null because list is nullible
      });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });

        //note document name has to be unique
        for (var answer in questions.answers!) {
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier, //i.e A, B, C...
            "answer": answer.answer
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed; //1
  }
}
