import 'package:clippy/src/core_features/auth/application/bloc/auth_bloc.dart';
import 'package:clippy/src/core_features/auth/application/reposetory/AuthRepo.dart';
import 'package:clippy/src/global_things/application/global_blocs.dart';
import 'package:clippy/src/global_things/application/global_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/common_widgets/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//code in MyApp sets up whole app, creates app wide state, names app, defines
//visual theme and sets home widget (starting point of your app)


//run, debug, profile
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepo(),
      child: BlocProvider(
        create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepo>(context)),
        child: BlocProvider(
          create: (context) => GlobalBlocs(),
          child: BlocBuilder<GlobalBlocs, GlobalStates>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Clippy',
                debugShowCheckedModeBanner: false,
                //theme settings for all application and
                // we can change it in any place of app with global bloc call
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
                  useMaterial3: true,
                  //global styles for buttons
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
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
                home: HomePage(),
              );
            },
          ),
        ),
      ),
    ); //MaterialApp
  }
}

//other stuff here
