import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/model/user_model.dart';

class ProfileProvider with ChangeNotifier {
  late UserModel userModel;
  bool profileFetching = false;
  bool isProfileUpdating = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void profileToggle() {
    profileFetching = !profileFetching;
    notifyListeners();
  }

  void profileUpdateToggle() {
    isProfileUpdating = !isProfileUpdating;
    notifyListeners();
  }

  Future<void> getUserData() async {
    profileToggle();

    try {
      Response userData = await Dio().get(
        "$baseUrl/$userRoute",
        options: Options(
          headers: {"Authorization": authToken},
        ),
      );
      userModel = UserModel.fromJson(userData.data);
      userName = userModel.username;
      writeStorage(storageUserName, userModel.username);
      nameController.text = userName;
      emailController.text = userModel.email;
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      profileToggle();
    }
  }

  Future<void> updateUserData() async {
    profileUpdateToggle();
    try {
      Response userData = await Dio().put(
        "$baseUrl/$userRoute",
        data: {
          "username": nameController.text,
        },
        options: Options(
          headers: {"Authorization": authToken},
        ),
      );
      userName = nameController.text;
      writeStorage(storageUserName, nameController.text);
      nameController.text = userName;
      emailController.text = userModel.email;
      customSnackBar("Success", "Profile Updated Successfully", "green");
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      profileUpdateToggle();
    }
  }
}
