import 'package:get/get.dart';
import 'package:moon_flutter_getx_architecture/screens/home_screen/binding/home_binding.dart';
import 'package:moon_flutter_getx_architecture/screens/home_screen/view/home_screen_view.dart';
import 'package:moon_flutter_getx_architecture/screens/add_user_screen/view/add_user_view.dart';
import 'package:moon_flutter_getx_architecture/screens/splash_screen/view/splash_screen_view.dart';
import 'package:moon_flutter_getx_architecture/screens/add_user_screen/binding/add_user_binding.dart';

class AppRoutes {
  AppRoutes._();

  static Transition transition = Transition.rightToLeftWithFade;
  static Duration transitionDuration = const Duration(milliseconds: 500);

  static const String splashPage = "/";
  static const String homePage = "/home_page";
  static const String addUserPage = "/add_user_page";

  static final List<GetPage> getPages = [
    GetPage(
      name: splashPage,
      page: () => SplashScreenView(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: homePage,
      page: () => const HomeScreenView(),
      binding: HomeBinding(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: addUserPage,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
  ];
}
