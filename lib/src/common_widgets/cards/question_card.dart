//stack widget business
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);


  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    //saves bandwidth, avoid unnecessary calls to server
                    imageUrl: model.imageUrl!,

                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child:
                      const CircularProgressIndicator(), //oc: can add pre loader image as well
                    ), //show progress while loading image
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images1/app_splash_logo.png"), //default fallback img from local folder while waiting for network images to load
                    //show no image available image on error loading
                  ),
                ))],
          )
        ],
    );
  }
}

