import 'package:cloud_firestore/cloud_firestore.dart';

//collection references to firestore

//instance firestore variable
final fireStore = FirebaseFirestore.instance;

final questionPaperRF = fireStore.collection('questionPapers');

DocumentReference questionRF({
  required String paperId, //document name in survey, i.e. education
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);
