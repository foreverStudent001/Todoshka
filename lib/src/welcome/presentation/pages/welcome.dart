import 'package:clippy/src/common_widgets/home.dart';
import 'package:clippy/src/welcome/presentation/components/center_next_button.dart';
import 'package:clippy/src/welcome/presentation/components/splash_view.dart';
import 'package:clippy/src/welcome/presentation/components/top_back_skip_view.dart';
import 'package:clippy/src/welcome/presentation/components/welcome_page_template.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState
    extends State<Welcome> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            WelcomePageTemplate(
                animationController: _animationController!,
                title: "Lists",
                description: '#todo change picture to ui of making lists',
                imagePath: 'assets/images/welcome/relax_image.png',
                orderElements: [ 'title','description', 'image'],
                animationInterval: {
                  'firstHalfAnimation': [0.0, 0.2],
                  'secondHalfAnimation': [0.2, 0.4],
                  'moodFirstHalfAnimation': [0.2, 0.4],
                  'moodSecondHalfAnimation': [0.0, 0.2],
                  'imageFirstHalfAnimation': [0.0, 0.2],
                  'imageSecondHalfAnimation': [0.2, 0.4]
                }
            ),
            //CareView
            WelcomePageTemplate(
              animationController: _animationController!,
              title: "Theme",
              description: '#todo change picture to ui of changing theme',
              imagePath: 'assets/images/welcome/care_image.png',
              orderElements: [ 'image','title', 'description'],
              animationInterval: {
                'firstHalfAnimation': [0.2, 0.4],
                'secondHalfAnimation': [0.4, 0.6],
                'moodFirstHalfAnimation': [0.2, 0.4],
                'moodSecondHalfAnimation': [0.4, 0.6],
                'imageFirstHalfAnimation': [0.2, 0.4],
                'imageSecondHalfAnimation': [0.4, 0.6]
              }
            ),
            //MoodDiaryView
            WelcomePageTemplate(
                animationController: _animationController!,
                title: "Maybe Assistant or family sharing",
                description: '#todo figure it out how to realize this idea ¯\\ _(ツ)_/¯',
                imagePath: 'assets/images/welcome/mood_dairy_image.png',
                orderElements: [ 'title','description','image'],
                animationInterval: {
                  'firstHalfAnimation': [0.4, 0.6],
                  'secondHalfAnimation': [0.6, 0.8],
                  'moodFirstHalfAnimation': [0.4, 0.6],
                  'moodSecondHalfAnimation': [0.6, 0.8],
                  'imageFirstHalfAnimation': [0.4, 0.6],
                  'imageSecondHalfAnimation': [0.6, 0.8]
                }
            ),
            WelcomePageTemplate(
                animationController: _animationController!,
                title: "Welcome",
                description: 'some text of description bla bla bla stay calm and e.t.c',
                imagePath: 'assets/images/welcome/welcome.png',
                orderElements: ['image','title','description'],
                animationInterval: {
                  'firstHalfAnimation': [0.6, 0.8],
                  'secondHalfAnimation': [0.8, 1.0],
                  'moodFirstHalfAnimation': [0.6, 0.8],
                  'moodSecondHalfAnimation': [0.8, 1.0],
                  'imageFirstHalfAnimation': [0.6, 0.8],
                  'imageSecondHalfAnimation': [0.8, 1.0]
                }
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePage())
    );
  }
}