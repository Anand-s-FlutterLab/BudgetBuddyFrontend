import 'package:budget_buddy/core/app_export.dart';

class LoginProvider with ChangeNotifier {
  bool isLogin = false;
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void obscureTextToggle() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void loginToggle() {
    isLogin = !isLogin;
    notifyListeners();
  }

  Future<void> onLogin() async {
    loginToggle();
    try {
      Response loginUser = await Dio().post(
        "$baseUrl/$loginRoute",
        data: {
          "email": emailController.text,
          "password": passwordController.text
        },
      );
      if (loginUser.statusCode == 200) {
        authToken = "Bearer ${loginUser.data}";
        // TODO Add Routing Here
      }
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      loginToggle();
    }
  }
}
