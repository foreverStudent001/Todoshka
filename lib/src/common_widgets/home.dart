import 'package:clippy/src/pages/presentation/primary/first_page.dart';
import 'package:clippy/src/pages/presentation/primary/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global_things/application/global_blocs.dart';
import '../global_things/application/global_events.dart';
//import 'package:clippy/src/common_widgets/sample_widget.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  static List<StatelessWidget> pages = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Clippy", style: TextStyle()),
      ),
      body: pages[currentPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => BlocProvider.of<GlobalBlocs>(context).add(ToggleTheme()),
        child: const Icon(Icons.light_mode),
      ),
      //just example, will change soon
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                currentPage = 0;
              });
            }, icon: const Icon(Icons.home_filled)),
            IconButton(onPressed: (){
              setState(() {
                currentPage = 1;
              });
            }, icon: const Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
} //homepage