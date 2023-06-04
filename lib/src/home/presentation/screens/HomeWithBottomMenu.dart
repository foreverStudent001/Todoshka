import 'package:clippy/pages/home/home.dart';
import 'package:clippy/pages/user/user_profile.dart';
import 'package:clippy/src/global/application/global_blocs.dart';
import 'package:clippy/src/global/application/global_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWithBottomMenu extends StatefulWidget {
  const HomeWithBottomMenu({super.key});


  @override
  State<HomeWithBottomMenu> createState() => _HomeWithBottomMenuState();
}

class _HomeWithBottomMenuState extends State<HomeWithBottomMenu> {
  int currentPage = 0;
  static const pages = [Home(), UserProfile()];

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
        tooltip: 'Increment Counter',
        child: const Icon(Icons.light_mode),
      ),
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
      /*NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),*/

    );
  }
}