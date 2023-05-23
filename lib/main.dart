import 'package:clippy/pages/home/home.dart';
import 'package:clippy/pages/user/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void test() {

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  const MyApp({super.key});
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                minimumSize: const Size(300, 50)
            )
        )
      ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  minimumSize: const Size(300, 50)
              )
          )
      ),
      themeMode: _themeMode,
      home: MyHomePage(title: 'Clippy', changeTheme: this.changeTheme, themeMode: _themeMode),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required void Function(ThemeMode themeMode) changeTheme, required themeMode});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  static const pages = [Home(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(widget.title, style: TextStyle()),
      ),
      body: pages[currentPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => {
          MyApp.of(context).changeTheme(
              MyApp.of(context)._themeMode.name == 'dark' ? ThemeMode.light : ThemeMode.dark
          ),
        },
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
              }, icon: Icon(Icons.home_filled)),
            IconButton(onPressed: (){
              setState(() {
              currentPage = 1;
            });
              }, icon: Icon(Icons.person)),
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
