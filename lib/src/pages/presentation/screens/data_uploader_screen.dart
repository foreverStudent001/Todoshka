import 'package:clippy/src/pages/presentation/controllers/question_papers/data_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/firebase_ref/loading_status.dart';

//stateless class. We will call DataUploaderScreen from main.dart
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);

//call DataUploader controller
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(()=>Text(controller.loadingStatus.value==LoadingStatus.completed?"Uploading completed":
      "Uploading...")),
    ));
  }
}
