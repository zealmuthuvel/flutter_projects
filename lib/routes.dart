import 'package:get/get.dart';
import 'package:newapp/Detailspage/details_screen.dart';
import 'package:newapp/Homepage/home_screen.dart';
import 'package:newapp/splashscreen/spalsh_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String home = '/home_screen';
  static String detailPage = '/detail_screen';
}

final getPages = [
  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Routes.detailPage,
    page: () => const DetailScreen(),
  ),
];
