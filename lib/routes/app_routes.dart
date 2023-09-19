import 'package:budget_buddy/screens/add_income_expense_screen.dart';
import 'package:budget_buddy/screens/home_screen.dart';
import 'package:budget_buddy/screens/login_screen.dart';
import 'package:budget_buddy/screens/signup_screen.dart';
import 'package:budget_buddy/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define route names as constants.
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String homeScreen = "/home_screen";
  static String addIncomeExpenseScreen = "/add_income_expense_screen";

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
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: addIncomeExpenseScreen,
      page: () => const AddIncomeExpenseScreen(),
      bindings: const [],
      transition: Transition.rightToLeft,
    ),
  ];
}