import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/core/utils/validation_function.dart';
import 'package:budget_buddy/provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          width: width,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: loginProvider.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.13,
                    child: Image(
                      image: AssetImage(appLogo),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  customText(
                    text: "Welcome Back!",
                    color: primaryColor,
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customText(
                    text: "Sign in to your account",
                    color: primaryColor,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    decoration: AppDecoration.inputBoxDecorationShadow(),
                    child: TextFormField(
                      controller: loginProvider.emailController,
                      style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppDecoration().textInputDecoration(
                        hintText: "Enter Email Address Here",
                        lableText: "Email",
                        icon: Icons.email_rounded,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide an Email Address';
                        }
                        if (!emailValidator.hasMatch(value)) {
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: AppDecoration.inputBoxDecorationShadow(),
                    child: TextFormField(
                      controller: loginProvider.passwordController,
                      style: AppStyle.textFormFieldStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: width * 0.05,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock, size: width * 0.06),
                        prefixIconColor: primaryColor,
                        suffix: GestureDetector(
                          onTap: () {
                            loginProvider.obscureTextToggle();
                          },
                          child: loginProvider.obscureText
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                        labelStyle: AppStyle.textFormFieldStyle(
                            color: primaryColor, fontSize: width * 0.05),
                        hintText: "Enter Password Here",
                        hintStyle: AppStyle.textFormFieldStyle(
                            color: Colors.grey, fontSize: width * 0.05),
                        errorStyle: AppStyle.textFormFieldStyle(
                            color: Colors.red, fontSize: width * 0.05),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.red, width: 2.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.red, width: 2.0)),
                      ),
                      obscureText: loginProvider.obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide Password';
                        }
                        if (!passwordValidator.hasMatch(value)) {
                          return 'Enter Valid Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginProvider.onLogin(context);
                    },
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      decoration: AppDecoration.buttonBoxDecoration(),
                      child: loginProvider.isLogin
                          ? customButtonLoadingAnimation(size: width * 0.1)
                          : customText(
                              text: "Login",
                              color: Colors.white,
                              fontSize: width * 0.08,
                            ), // Display "Login" text
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  customText(
                    color: blackColor,
                    text: "Not having an Account?",
                    fontSize: width * 0.05,
                  ),
                  SizedBox(
                    height: height * 0.01, // Add vertical spacing
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(AppRoutes.signupScreen),
                    child: customText(
                      color: primaryColor,
                      text: "Signup Here",
                      fontSize: width * 0.05,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
