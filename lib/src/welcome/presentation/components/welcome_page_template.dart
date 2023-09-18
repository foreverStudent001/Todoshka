import 'package:flutter/cupertino.dart';

class WelcomePageTemplate extends StatelessWidget {
  final AnimationController animationController;
  final String title;
  final String description;
  final String imagePath;
  final List<String> orderElements;
  final Map<String, List<double>> animationInterval;

  const WelcomePageTemplate({
    Key? key,
    required this.animationController,
    required this.title,
    required this.description,
    required this.imagePath,
    this.orderElements = const ['title', 'description', 'image'],
    this.animationInterval = const {
      'firstHalfAnimation': [0.4, 0.6],
      'secondHalfAnimation': [0.6, 0.8],
      'moodFirstHalfAnimation': [0.4, 0.6],
      'moodSecondHalfAnimation': [0.6, 0.8],
      'imageFirstHalfAnimation': [0.4, 0.6],
      'imageSecondHalfAnimation': [0.6, 0.8]
    }
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['firstHalfAnimation']![0],
        animationInterval['firstHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final secondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['secondHalfAnimation']![0],
        animationInterval['secondHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final moodFirstHalfAnimation =
    Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['moodFirstHalfAnimation']![0],
        animationInterval['moodFirstHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final moodSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['moodSecondHalfAnimation']![0],
        animationInterval['moodSecondHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final imageFirstHalfAnimation =
    Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['imageFirstHalfAnimation']![0],
        animationInterval['imageFirstHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final imageSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        animationInterval['imageSecondHalfAnimation']![0],
        animationInterval['imageSecondHalfAnimation']![1],
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: orderElements.map((entry) {
                switch (entry) {
                  case 'title':
                    return _title(title);
                  case 'description':
                    return _description(description, moodFirstHalfAnimation, moodSecondHalfAnimation);
                  case 'image':
                    return _image(imagePath, imageFirstHalfAnimation, imageSecondHalfAnimation);
                  default:
                    return _title(title);
                }
              }).toList(),
            )
        ),
      ),
    );
  }
}

Widget _title(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
  );
}

Widget _description(String description, moodFirstHalfAnimation, moodSecondHalfAnimation){
  //debugPrint(moodFirstHalfAnimation);
    return SlideTransition(
      position: moodFirstHalfAnimation,
      child: SlideTransition(
        position: moodSecondHalfAnimation,
        child: Padding(
          padding: EdgeInsets.only(
              left: 64, right: 64, top: 16, bottom: 16),
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
}

Widget _image(String imagePath, imageFirstHalfAnimation, imageSecondHalfAnimation){
  return SlideTransition(
    position: imageFirstHalfAnimation,
    child: SlideTransition(
      position: imageSecondHalfAnimation,
      child: Container(
        constraints: BoxConstraints(maxWidth: 350, maxHeight: 250),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
