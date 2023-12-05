import 'package:clippy/src/core_features/auth/presentation/sign_in_screen.dart';
import 'package:clippy/src/core_features/todo_list/presentation/lists_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global_things/application/global_blocs.dart';
import '../global_things/application/global_events.dart';
import 'package:circular_menu/circular_menu.dart';
//import 'package:clippy/src/common_widgets/sample_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  static List<Widget> pages = [ListsView(), SignInScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Clippy", style: TextStyle()),
      ),
      body: pages[currentPage],

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircularMenu(
            alignment: Alignment.bottomLeft,
            toggleButtonColor: Theme.of(context).primaryColor,
            toggleButtonBoxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 10,
              ),
            ],
            toggleButtonIconColor: Colors.white,
            toggleButtonMargin: 10.0,
            toggleButtonPadding: 10.0,
            toggleButtonSize: 40.0,
            items: [
              CircularMenuItem(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 10,
                  ),
                ],
                  color: Theme.of(context).primaryColor,
                  icon: Icons.home,
                  onTap: () {
                    setState(() {
                      currentPage = 0;
                    });
                  }),
              CircularMenuItem(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 10,
                  ),
                ],
                  color: Theme.of(context).primaryColor,
                  icon: BlocProvider.of<GlobalBlocs>(context)
                              .state
                              .themeMode
                              .name ==
                          'dark'
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  onTap: () {
                    BlocProvider.of<GlobalBlocs>(context).add(ToggleTheme());
                  }),
              CircularMenuItem(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 10,
                  ),
                ],
                color: Theme.of(context).primaryColor,
                  icon: Icons.person,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                    /*setState(() {
                      currentPage = 1;
                    });*/
                  }),
            ]),
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
      ),*/
    );
  }
} //homepage
