// there I will have a static method called onGenerateRoute that will return a MaterialPageRoute.
import 'package:get/get.dart';
import 'package:mata_online_market/features/introduction_screen/presentation/introduction_screen.dart';
import 'package:mata_online_market/main.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';
  static const String introductionScreen = '/introductionScreen';

  //Route path getters
  static String getInitialRoute() => initialRoute;
  static String getIntroductionScreen() => introductionScreen;

  //Routes list
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => const MyHomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: introductionScreen,
      page: () => const IntroductionsScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
