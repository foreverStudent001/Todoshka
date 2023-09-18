import 'package:clippy/src/global_things/application/global_blocs.dart';
import 'package:clippy/src/global_things/application/global_states.dart';
import 'package:clippy/src/welcome/presentation/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'src/common_widgets/home.dart';

//code in MyApp sets up whole app, creates app wide state, names app, defines
//visual theme and sets home widget (starting point of your app)

//run, debug, profile
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalBlocs(),
        child: ScreenUtilInit(
          builder: (context, child) => BlocBuilder<GlobalBlocs, GlobalStates>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Clippy',
                debugShowCheckedModeBanner: false,
                //theme settings for all application and
                // we can change it in any place of app with global bloc call
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.transparent),
                  useMaterial3: true,
                  //global styles for buttons
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                    ),
                  ),
                ),
                //Theme changing
                darkTheme: ThemeData(
                  colorScheme: const ColorScheme.dark(),
                  useMaterial3: true,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      minimumSize: const Size(300, 50),
                    ),
                  ),
                ),
                themeMode: state.themeMode,
                home: Welcome(),
              );
            },
          ),
        )); //MaterialApp
  }
}

//other stuff here
