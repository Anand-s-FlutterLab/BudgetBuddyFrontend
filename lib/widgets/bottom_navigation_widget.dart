import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/profile_provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationWidgetState();
  }
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.06,
      child: Theme(
        data: ThemeData(
          canvasColor: whiteColor,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.black54,
          selectedItemColor: primaryColor,
          elevation: 0.0,
          selectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedBottomNavigationIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              activeIcon: activeIconBuilder(
                  icon: Icons.home, title: "Home", isMarginRequired: true),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.track_changes,
                color: Colors.black,
              ),
              activeIcon: activeIconBuilder(
                icon: Icons.track_changes,
                title: "Transaction",
              ),
              label: "Transaction",
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.auto_graph_outlined,
                color: Colors.black,
              ),
              activeIcon: activeIconBuilder(
                icon: Icons.auto_graph,
                title: "Analysis",
              ),
              label: "Analysis",
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              activeIcon: activeIconBuilder(
                icon: Icons.person,
                title: "Profile",
                isMarginRequired: true,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
      debugPrint("Selected Index :: $selectedBottomNavigationIndex");
      _navigateToScreens(selectedBottomNavigationIndex);
    });
  }

  // This will navigate to respective pages
  void _navigateToScreens(int index) {
    if (index == 0) {
      debugPrint("Navigating to Home");
      Get.offNamed(AppRoutes.homeScreen);
    } else if (index == 1) {
      debugPrint("Navigating to Transactions");
      Get.offNamed(AppRoutes.transactionScreen);
    } else if (index == 2) {
      debugPrint("Navigating to Analysis");
      Get.offNamed(AppRoutes.analysisScreen);
    } else if (index == 3) {
      debugPrint("Navigating to Profile");
      Get.offNamed(AppRoutes.profileScreen);
    }
  }
}

Widget activeIconBuilder({
  required IconData icon,
  required String title,
  bool isMarginRequired = false,
}) {
  return Container(
    margin: isMarginRequired
        ? const EdgeInsets.only(left: 10, right: 10)
        : EdgeInsets.zero,
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: whiteColor,
        ),
        customText(
          text: title,
          color: whiteColor,
        ),
      ],
    ),
  );
}
