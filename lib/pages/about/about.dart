import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('About'),
      ),
      body: Center(
        child: Container(
          child: const Text(
            "It's Clippy app!! and It's todo list with motivation! (but I'm still not sure 😅)",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          padding: EdgeInsets.all(80),
        )
      ),
    );
  }
}
