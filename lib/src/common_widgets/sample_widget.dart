//libraries
import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('This works'));
  }
}

class MyClippyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var assetsImage = AssetImage('assets/images/test.PNG');
    var image = Image(image: assetsImage, width: 766.0, height: 771.0); //insert dimensions of image here
    return Container(child: image);
  }
}