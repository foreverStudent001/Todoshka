import 'package:clippy/pages/home/home.dart';
import 'package:clippy/pages/user/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

void main() {
  /*WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);*/
  runApp(const MyApp());

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
  ThemeMode _themeMode = ThemeMode.dark;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoshka',
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
          colorScheme: const ColorScheme.dark(primary: Colors.white),
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
      home: SplashScreen.navigate(
        name: 'assets/animations/splashscreen.riv',
        next: (context) => MyHomePage(title: 'Todoshka', changeTheme: changeTheme, themeMode: _themeMode),
        until: () => Future.delayed(const Duration(seconds: 6)),
        startAnimation: 'Timeline 1',
        backgroundColor: const Color(0xFF353535),
      ),
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
  void initState() {
    super.initState();
    /*initialization();*/
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    /*print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');*/
    FlutterNativeSplash.remove();
  }

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
