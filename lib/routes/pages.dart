import 'package:clippy/app/modules/home/bindings.dart';
import 'package:clippy/app/modules/home/page.dart';
import 'package:clippy/app/modules/menu/bindings.dart';
import 'package:clippy/app/modules/splash_screen/page.dart';
import 'package:clippy/app/modules/survey/bindings.dart';
import 'package:clippy/app/modules/survey/page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const SplashScreenPage(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        bindings: [HomeBinding(), MenuBinding()]
    ),
    GetPage(
        name: Routes.SURVEY,
        page: () => const SurveyPage(),
        bindings: [SurveyBinding()]
    ),
  ];
}