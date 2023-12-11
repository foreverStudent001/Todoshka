import 'package:clippy/firebase_options.dart';
import 'package:clippy/src/global_things/presentation/controllers/theme_controller.dart';
import 'package:clippy/src/utils/bindings/initial_bindings.dart';
import 'package:clippy/src/utils/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//code in MyApp sets up whole app, creates app wide state, names app, defines
//visual theme and sets home widget (starting point of your app)


//run, debug, profile

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

