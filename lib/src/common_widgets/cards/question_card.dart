import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy/src/common_widgets/text/app_icon_text.dart';
import 'package:clippy/src/global_things/presentation/themes/custom_text_styles.dart';
import 'package:clippy/src/global_things/presentation/themes/ui_parameters.dart';
import 'package:clippy/src/pages/domain/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_things/presentation/themes/app_icons.dart';

//stack widget

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);
  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: CachedNetworkImage(
                          //saves bandwidth, avoid unnecessary calls to server
                          imageUrl: model.imageUrl!,
                          //for each index we have model and for that model we have image url

                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child:
                                const CircularProgressIndicator(), //oc: can add pre loader image as well
                          ),
                          //show progress while loading image
                          errorWidget: (context, url, error) => Image.asset(
                              "assets/images1/app_splash_logo.png"), //default fallback img from local folder while waiting for network images to load
                          //show no image available image on error loading
                        ),
                      ),
                    )),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: cartTitles(context), //calls custom_text_styles
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(//another text widget
                            model.description),
                      ),
                      Row(
                        children: [
                          AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        //.withOpacity(0.3),
                              ),
                              text: Text('${model.questionCount} questions',
                              style: detailText.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context)
                                    .primaryColor
                                    //.withOpacity(0.3),
                              ),
                              ),),

                          const SizedBox(width: 15,),
                          AppIconText(
                            icon: Icon(
                                Icons.timer,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context)
                                    .primaryColor
                              //.withOpacity(0.3),
                            ),
                            text: Text(model.timeInMinutes(),
                              style: detailText.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context)
                                      .primaryColor
                                //.withOpacity(0.3),
                              ),
                            ),)

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: -padding,
                right: -padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Icon(AppIcons.trophyOutline),
                    //call app icon class and particular icon in assets folder
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(cardBorderRadius),
                          bottomRight: Radius.circular(cardBorderRadius),
                        ),
                        color: Theme.of(context).primaryColor),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
