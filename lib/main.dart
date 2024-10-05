import 'package:clippy/app/data/services/service.dart';
import 'package:clippy/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  /*
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  */
  initServices();
  runApp(GetMaterialApp(
    initialRoute: Routes.INITIAL,
    getPages: AppPages.pages,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

void initialization() async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because
  // delaying the user experience is a bad design practice!
  // ignore_for_file: avoid_print
  /*
    await Future.delayed(const Duration(seconds: 3));
  */
  FlutterNativeSplash.remove();
}

void initServices() async {
  print('run services ...');

  /// Service is singleton
  await Get.putAsync(() => AppConfigService().init());
  print('Все сервисы запущены...');
}
