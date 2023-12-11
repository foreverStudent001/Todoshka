import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

//collection references to firestore
//get reference from firebase storage
Reference get firebaseStorage => FirebaseStorage.instance.ref();

//instance firestore variable
final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');

DocumentReference questionRF({
  required String paperId, //document name in survey, i.e. education
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);

