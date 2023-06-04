import 'package:clippy/src/global/application/global_blocs.dart';
import 'package:clippy/src/global/application/global_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/home/presentation/screens/HomeWithBottomMenu.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalBlocs(),
        child: BlocBuilder<GlobalBlocs, GlobalStates>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Clippy',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
                  useMaterial3: true,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          minimumSize: const Size(300, 50)))),
              darkTheme: ThemeData(
                  colorScheme: const ColorScheme.dark(),
                  useMaterial3: true,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          minimumSize: const Size(300, 50)))),
              themeMode: state.themeMode,
              home: const HomeWithBottomMenu(),
              //MyHomePage(title: 'Clippy', changeTheme: this.changeTheme, themeMode: _themeMode),
            );
          },
        )
    );
  }
}
