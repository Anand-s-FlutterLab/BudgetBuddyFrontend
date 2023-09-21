import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/model/user_model.dart';
import 'package:budget_buddy/provider/home_provider.dart';

class LoginProvider with ChangeNotifier {
  bool isLogin = false;
  bool obscureText = true;
  late UserModel userModel;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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

  Future<void> onLogin(BuildContext context) async {
    if(loginFormKey.currentState!.validate()){
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
          Provider.of<HomeProvider>(context, listen: false).getUserIncomeExpense();
          getUserData();
        }
      } on DioException catch (err) {
        customSnackBar("Error", "${err.response?.data}");
        loginToggle();
      }
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
      Get.offNamed(AppRoutes.homeScreen);
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      loginToggle();
    }
  }
}
