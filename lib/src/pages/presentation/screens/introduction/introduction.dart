import 'package:clippy/src/common_widgets/buttons/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_things/presentation/themes/app_colors.dart';


class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}): super(key: key);

  static const String routeName = '/introduction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient:mainGradient(context)),
            alignment: Alignment.center,
            //containers optimal for alignment
            child: Padding(
              /*padding: EdgeInsets.all(8.0),*/
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),//fit based on width of screen
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                Icons.star,
                    size: 65, ),
                  const SizedBox(height:40),
                  const Text(
                      'Welcome to Clippy! This app can help you with creating and tracking your goals in fun and imaginative ways! ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color:onSurfaceTextColor,
                  fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(height:40),
                  AppCircleButton(
                      onTap: () => Get.offAndToNamed("/home"),
                      child:const Icon(Icons.arrow_forward, size: 35))
                ],

              ),
            )));
  }
}
