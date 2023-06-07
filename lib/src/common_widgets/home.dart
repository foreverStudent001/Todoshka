import 'package:clippy/src/common_widgets/basic_drawer.dart';
import 'package:flutter/material.dart';
//import 'package:clippy/src/common_widgets/sample_widget.dart';


class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key); //todo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          elevation: 0,
          title: Text('C L I P P Y'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                //open menu

              },
              icon: Icon(Icons.menu)
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //do something
                },
                icon: Icon(Icons.person)
            )

            //can add more buttons here

          ],
        ),
      drawer: BasicDrawer(),
    );
  }

} //homepage