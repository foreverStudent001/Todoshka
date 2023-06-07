//libraries
import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Text('This works'));
  }
}

class MyClippyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var assetsImage = new AssetImage('assets/images/test.PNG');
    var image = new Image(image: assetsImage, width: 766.0, height: 771.0); //insert dimensions of image here
    return new Container(child: image);
  }
}