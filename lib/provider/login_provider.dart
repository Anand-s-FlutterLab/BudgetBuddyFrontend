import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/model/user_model.dart';

class LoginProvider with ChangeNotifier {
  bool isLogin = false;
  bool obscureText = true;
  late UserModel userModel;
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
          "email": "anand@gmail.com",
          // "email": emailController.text,
          // "password": passwordController.text
          "password": "hello"
        },
      );
      if (loginUser.statusCode == 200) {
        authToken = "Bearer ${loginUser.data}";
        getUserData();
      }
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    }
  }

  Future<void> getUserData() async {
    try {
      Response userData = await Dio().get(
        "$baseUrl/$userRoute",
        options: Options(
          headers: {"Authorization": authToken},
        ),
      );
      userModel = UserModel.fromJson(userData.data);
      userName = userModel.username;
      writeStorage(storageAuthToken, authToken);
      writeStorage(storageUserName, userModel.username);
      Get.toNamed(AppRoutes.homeScreen);
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      loginToggle();
    }
  }
}
