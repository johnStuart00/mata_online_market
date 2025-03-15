import 'package:get/get.dart';
import 'package:mata_online_market/features/product_view_screen/presentation/product_view_screen.dart';
import 'package:mata_online_market/features/category_view_screen/presentation/category_view_screen.dart';
import 'package:mata_online_market/features/main_screen/presentation/main_screen.dart';
import 'package:mata_online_market/features/introduction_screen/presentation/introduction_screen.dart';
import 'package:mata_online_market/features/profile_screen/widgets/location_widget.dart';
import 'package:mata_online_market/features/profile_screen/widgets/security_privacy_widget.dart';
import 'package:mata_online_market/features/search_screen/presentation/search_screen.dart';
import 'package:mata_online_market/features/splash_screen/presentation/splash_screen.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';
  static const String splashScreen = '/splashScreen';
  static const String introductionScreen = '/introductionScreen';
  static const String searchScreen = '/searchScreen';
  static const String categoryViewScreen = '/categoryViewScreen';
  static const String productViewScreen = '/productViewScreen';
  static const String locationViewScreen = '/locationViewScreen';
  static const String securityPrivacyScreen = '/securityPrivacyScreen';

  //Route path getters
  static String getInitialRoute() => initialRoute;
  static String getIntroductionScreen() => introductionScreen;
  static String getSplashScreen() => splashScreen;

  //Routes list
  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
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
    GetPage(
      name: productViewScreen,
      page: () => const ProductViewScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: locationViewScreen,
      page: () => const LocationContainerWidget(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: securityPrivacyScreen,
      page: () => const SecurityPrivacyScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
