import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getUserData();
    return Scaffold(
      backgroundColor: whiteColor,
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          if (profileProvider.profileFetching) {
            return Center(
              child: customPageLoadingAnimation(
                  size: height * 0.08, color: primaryColor),
            );
          }
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: width,
              height: height * 0.94,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(height * 0.03),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle),
                    child: customText(
                      text: userName[0],
                      color: primaryColor,
                      fontSize: height * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    decoration: AppDecoration.inputBoxDecorationShadow(),
                    child: TextFormField(
                      controller: profileProvider.nameController,
                      decoration: AppDecoration().textInputDecoration(
                        icon: Icons.person,
                        lableText: "Name",
                        hintText: "Enter Name Here",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    decoration: AppDecoration.inputBoxDecorationShadow(),
                    child: TextFormField(
                      controller: profileProvider.emailController,
                      decoration: AppDecoration().textInputDecoration(
                        icon: Icons.email_rounded,
                        lableText: "Email",
                        hintText: "Enter Email Here",
                      ),
                      readOnly: true,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () => profileProvider.updateUserData(),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      decoration: AppDecoration.buttonBoxDecoration(),
                      child: profileProvider.isProfileUpdating
                          ? customButtonLoadingAnimation(size: width * 0.1)
                          : customText(
                        text: "Update",
                        color: Colors.white,
                        fontSize: width * 0.08,
                      ), // Display "Login" text
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            clearStorage();
                            Get.offAllNamed(AppRoutes.loginScreen);
                            selectedBottomNavigationIndex = 0;
                            authToken = "";
                            userName = "";
                          },
                          child: Container(
                            width: width * 0.5,
                            padding:
                            const EdgeInsets.only(bottom: 10, top: 10),
                            decoration: BoxDecoration(
                                color: Colors.red.shade900,
                                borderRadius: BorderRadius.circular(40)),
                            child: profileProvider.isProfileUpdating
                                ? customButtonLoadingAnimation(
                                size: width * 0.1)
                                : customText(
                              text: "Logout",
                              color: Colors.white,
                              fontSize: width * 0.05,
                            ), // Display "Login" text
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
