// there I will have a static method called onGenerateRoute that will return a MaterialPageRoute.
import 'package:get/get.dart';
import 'package:mata_online_market/features/category_view_screen/presentation/category_view_screen.dart';
import 'package:mata_online_market/features/main_screen/presentation/main_screen.dart';
import 'package:mata_online_market/features/introduction_screen/presentation/introduction_screen.dart';
import 'package:mata_online_market/features/search_screen/presentation/search_screen.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';
  static const String introductionScreen = '/introductionScreen';
  static const String searchScreen = '/searchScreen';
  static const String categoryViewScreen = '/categoryViewScreen';

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
    GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: categoryViewScreen,
      page: () => const CategoryViewScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
