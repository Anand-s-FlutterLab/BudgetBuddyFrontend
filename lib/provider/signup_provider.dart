import 'package:budget_buddy/core/app_export.dart';

class SignupProvider with ChangeNotifier {
  bool isSignup = false;
  bool obscureText = true;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final TextEditingController unameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void obscureTextToggle() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void signupToggle() {
    isSignup = !isSignup;
    notifyListeners();
  }

  Future<void> onSignup() async {
    if(signupFormKey.currentState!.validate()){
      signupToggle();
      try {
        Response signupUser = await Dio().post(
          "$baseUrl/$signupRoute",
          data: {
            "username": unameController.text,
            "email": emailController.text,
            "password": passwordController.text
          },
        );
        if (signupUser.statusCode == 201) {
          authToken = "Bearer ${signupUser.data}";
          userName = unameController.text;
          writeStorage(storageAuthToken, authToken);
          writeStorage(storageUserName, unameController.text);
          Get.toNamed(AppRoutes.homeScreen);
        }
      } on DioException catch (err) {
        customSnackBar("Error", "${err.response?.data}");
      } finally {
        signupToggle();
      }
    }
  }
}
