//stack widget business
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: SizedBox(
                      height: Get.width*0.15,
                      width: Get.width*0.15,
                      child: CachedNetworkImage(
                        //saves bandwidth, avoid unnecessary calls to server
                        imageUrl: model.imageUrl!, //for each index we have model and for that model we have image url

                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          child:
                          const CircularProgressIndicator(), //oc: can add pre loader image as well
                        ), //show progress while loading image
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images1/app_splash_logo.png"), //default fallback img from local folder while waiting for network images to load
                        //show no image available image on error loading
                      ),
                    ),
                  ))],
            )
          ],
      ),
    );
  }
}

