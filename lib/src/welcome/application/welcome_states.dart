
class WelcomeStates{
  /*
    animationController: _animationController!,
    title: "Care",
    description: 'some text of description bla bla bla stay calm and e.t.c',
    imagePath: 'assets/images/welcome/care_image.png',
    orderElements: [ 'image','title', 'description'],
    animationInterval: {
      'firstHalfAnimation': [0.2, 0.4],
      'secondHalfAnimation': [0.4, 0.6],
      'moodFirstHalfAnimation': [0.2, 0.4,],
      'moodSecondHalfAnimation': [0.4, 0.6,],
      'imageFirstHalfAnimation': [0.2, 0.4,],
      'imageSecondHalfAnimation': [0.4, 0.6,]
    }
  */
  Map<String, dynamic> pagesConfiguration;

  WelcomeStates({required this.pagesConfiguration});
}

class InitStates extends WelcomeStates{
  InitStates(): super(
      pagesConfiguration: {

      }
  );

}