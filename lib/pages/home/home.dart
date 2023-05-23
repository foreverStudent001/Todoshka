import 'package:clippy/pages/test/test.dart';
import 'package:flutter/material.dart';

import '../about/about.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const About();
                }));
              },
              child: const Text('About')),
          ElevatedButton(onPressed: () {}, child: Text("Profile")),
          ElevatedButton(onPressed: () {}, child: Text("Themes")),
          ElevatedButton(onPressed: () {}, child: Text("Support")),
          ElevatedButton(onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const Test();
            }));
          }, child: const Text("Test Components")),
        ],
      ),
    );
  }
}
