import 'package:budget_buddy/screens/add_income_expense_screen.dart';
import 'package:budget_buddy/screens/analysis_screen.dart';
import 'package:budget_buddy/screens/home_screen.dart';
import 'package:budget_buddy/screens/login_screen.dart';
import 'package:budget_buddy/screens/profile_screen.dart';
import 'package:budget_buddy/screens/signup_screen.dart';
import 'package:budget_buddy/screens/splash_screen.dart';
import 'package:budget_buddy/screens/transction_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Define route names as constants.
  static String splashScreen = "/splash_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String homeScreen = "/home_screen";
  static String addIncomeExpenseScreen = "/add_income_expense_screen";
  static String transactionScreen = "/transaction_screen";
  static String analysisScreen = "/analysis_screen";
  static String profileScreen = "/profile_screen";

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
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
      bindings: const [],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: const [],
    ),
    GetPage(
      name: addIncomeExpenseScreen,
      page: () => const AddIncomeExpenseScreen(),
      bindings: const [],
    ),
    GetPage(
      name: transactionScreen,
      page: () => const TransactionScreen(),
      bindings: const [],
    ),
    GetPage(
      name: analysisScreen,
      page: () => const AnalysisScreen(),
      bindings: const [],
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      bindings: const [],
    ),
  ];
}