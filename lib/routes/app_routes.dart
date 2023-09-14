import 'package:budget_buddy/screens/login_screen.dart';
import 'package:budget_buddy/screens/signup_screen.dart';
import 'package:budget_buddy/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define route names as constants.
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
  ];
}