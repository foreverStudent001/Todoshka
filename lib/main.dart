import 'package:flutter/material.dart';
import 'src/common_widgets/home.dart';


//code in MyApp sets up whole app, creates app wide state, names app, defines
//visual theme and sets home widget (starting point of your app)

//run, debug, profile
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); //MaterialApp
    return const Placeholder();
  }
}

//other stuff here
