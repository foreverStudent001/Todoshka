import 'package:clippy/src/pages/presentation/controllers/question_papers/question_paper_controller.dart';
import 'package:clippy/src/pages/presentation/screens/home/home_screen.dart';
import 'package:clippy/src/pages/presentation/screens/introduction/introduction.dart';
import 'package:clippy/src/pages/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static List<GetPage> routes()=>[
    //backslash here refers to first screen of whole app
    GetPage(name: "/", page: ()=> SplashScreen()),
    GetPage(name:"/introduction",page:()=>AppIntroductionScreen(),
    ),

    GetPage(
      name: "/home",
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(QuestionPaperController());
      })),

  ];
}