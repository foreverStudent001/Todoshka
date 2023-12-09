import 'package:clippy/src/core_features/auth/application/bloc/auth_bloc.dart';
import 'package:clippy/src/core_features/auth/application/reposetory/AuthRepo.dart';
import 'package:clippy/src/core_features/todo_list/application/bloc/lists_bloc.dart';
import 'package:clippy/src/core_features/todo_list/application/reposetory/ListsRepo.dart';
import 'package:clippy/src/global_things/application/global_blocs.dart';
import 'package:clippy/src/global_things/application/global_states.dart';
import 'package:clippy/src/global_things/presentation/controllers/theme_controller.dart';
import 'package:clippy/src/global_things/presentation/themes/app_dark_theme.dart';
import 'package:clippy/src/global_things/presentation/themes/app_light_theme.dart';
import 'package:clippy/src/pages/presentation/screens/data_uploader_screen.dart';
import 'package:clippy/src/pages/presentation/screens/introduction/introduction.dart';
import 'package:clippy/src/pages/presentation/screens/splash_screen.dart';
import 'package:clippy/src/utils/bindings/initial_bindings.dart';
import 'package:clippy/src/utils/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'src/common_widgets/home.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

//code in MyApp sets up whole app, creates app wide state, names app, defines
//visual theme and sets home widget (starting point of your app)




//run, debug, profile

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies(); //injecting the injection into here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().darkTheme, //todo: toggle switch
      getPages: AppRoutes.routes(),
    );
  }
}

/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(home:DataUploaderScreen()));
}*/



//excess
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        Provider<AuthRepo>(create: (context) => AuthRepo()),
        Provider<ListsRepo>(create: (context) => ListsRepo()),
      ],
      child: BlocProvider(
        create: (context) =>
            AuthBloc(authRepository: RepositoryProvider.of<AuthRepo>(context)),
        child: BlocProvider(
          create: (context) =>
              ListsBloc(listsRepo: RepositoryProvider.of<ListsRepo>(context)),
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
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: Colors.transparent),
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
      ),
    );
  }
}*/

//other stuff here
