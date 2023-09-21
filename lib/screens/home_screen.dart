import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.isGettingUserIncomeExpense) {
            return Center(
              child: customPageLoadingAnimation(
                  size: height * 0.08, color: primaryColor),
            );
          } else if (homeProvider.isMonthlyBudgetEmpty) {
            return Center(
              child: customText(
                text:
                    "You don't Have Current Month's Entry\nYou need to enter an entry to see the screen",
                maxLines: 3,
                color: primaryColor,
                fontSize: width * 0.06,
              ),
            );
          } else {
            final currentMonthData =
                homeProvider.monthlyBudget.months[currentMonthYear];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: "Hello $userName",
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.profileScreen)?.then(
                                (value) => selectedBottomNavigationIndex = 0);
                            selectedBottomNavigationIndex = 3;
                          },
                          child: Container(
                            height: width * 0.12,
                            width: width * 0.12,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: blackColor,
                              size: height * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: width,
                      height: height * 0.26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffc5c5c5),
                            blurRadius: 5,
                            offset: Offset(10, 10),
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage(cardBackgroundImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardRowTextBuilder(
                              text1: "Your Balance",
                              text2: currentMonthYear,
                              fontSize1: width * 0.06),
                          customText(
                            color: whiteColor,
                            text:
                                "$rupeeSymbol ${numberFormatter(currentMonthData!.income - currentMonthData.expense)}",
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.08,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardColumnTextBuilder(
                                text1: "Spent",
                                text2:
                                    "$rupeeSymbol ${numberFormatter(currentMonthData.expense)}",
                              ),
                              cardColumnTextBuilder(
                                text1: "Income",
                                text2:
                                    "$rupeeSymbol ${numberFormatter(currentMonthData.income)}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: width * 0.05),
                        alignment: Alignment.centerLeft,
                        child: customText(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.06,
                          text: "Monthly Expenditure",
                        ),
                      ),
                      if (!homeProvider.isMonthlyBudgetEmpty)
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.addIncomeExpenseScreen)?.then(
                              (value) => homeProvider.getUserIncomeExpense(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: AppDecoration.containerBoxDecoration(
                                color: primaryColor,
                                borderRadius: 8,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      if (currentMonthData.income > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.green.shade50,
                          image: homeListSalary,
                          title: "Salary",
                          spentMoney: currentMonthData.income,
                          percentage: 100,
                        ),
                      if (currentMonthData.housing > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.yellow.shade100,
                          image: homeListHouse,
                          title: "Housing",
                          spentMoney: currentMonthData.housing,
                          percentage: ((currentMonthData.housing * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.transportation > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.blue.shade50,
                          image: homeListTransportation,
                          title: "Transportation",
                          spentMoney: currentMonthData.transportation,
                          percentage: ((currentMonthData.transportation * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.food > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.red.shade50,
                          image: homeListFood,
                          title: "Food",
                          spentMoney: currentMonthData.food,
                          percentage: ((currentMonthData.food * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.utilities > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.grey.shade200,
                          image: homeListUtilities,
                          title: "Utilities",
                          spentMoney: currentMonthData.utilities,
                          percentage: ((currentMonthData.utilities * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.healthcare > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.green.shade50,
                          image: homeListHealthcare,
                          title: "Healthcare",
                          spentMoney: currentMonthData.healthcare,
                          percentage: ((currentMonthData.healthcare * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.entertainment > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.pink.shade50,
                          image: homeListEntertainment,
                          title: "Entertainment",
                          spentMoney: currentMonthData.entertainment,
                          percentage: ((currentMonthData.entertainment * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.education > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.blueGrey.shade100,
                          image: homeListEducation,
                          title: "Education",
                          spentMoney: currentMonthData.education,
                          percentage: ((currentMonthData.education * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.gifts > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.red.shade50,
                          image: homeListGifts,
                          title: "Gifts",
                          spentMoney: currentMonthData.gifts,
                          percentage: ((currentMonthData.gifts * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.taxes > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.purple.shade50,
                          image: homeListTaxes,
                          title: "Taxes",
                          spentMoney: currentMonthData.taxes,
                          percentage: ((currentMonthData.taxes * 100) /
                              currentMonthData.expense),
                        ),
                      if (currentMonthData.miscellaneous > 0)
                        monthlyExpenditure(
                          boxDecorationColor: Colors.yellow.shade100,
                          image: homeListMiscellaneous,
                          title: "Miscellaneous",
                          spentMoney: currentMonthData.miscellaneous,
                          percentage: ((currentMonthData.miscellaneous * 100) /
                              currentMonthData.expense),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Provider.of<HomeProvider>(context)
              .isMonthlyBudgetEmpty
          ? FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                Get.toNamed(AppRoutes.addIncomeExpenseScreen)?.then(
                  (value) => Provider.of<HomeProvider>(context, listen: false)
                      .getUserIncomeExpense(),
                );
              },
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Icon(
                Icons.add_rounded,
                size: height * 0.04,
              ),
            )
          : null,
    );
  }
}

Widget cardRowTextBuilder({
  required String text1,
  required String text2,
  double fontSize1 = 18,
  double fontSize2 = 18,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customText(
        color: whiteColor,
        text: text1,
        fontWeight: FontWeight.w500,
        fontSize: fontSize1,
      ),
      customText(
        color: whiteColor,
        text: text2,
        fontWeight: FontWeight.w500,
        fontSize: fontSize2,
      ),
    ],
  );
}

Widget cardColumnTextBuilder({
  required String text1,
  required String text2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customText(
        color: whiteColor,
        text: text1,
        fontWeight: FontWeight.w500,
        fontSize: width * 0.05,
      ),
      customText(
        color: whiteColor,
        text: text2,
        fontWeight: FontWeight.w500,
        fontSize: width * 0.07,
      ),
    ],
  );
}

Widget monthlyExpenditure({
  required Color boxDecorationColor,
  required String image,
  required String title,
  required int spentMoney,
  required double percentage,
}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10, right: 20),
        height: height * 0.08,
        width: width,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: width * 0.15,
              height: width * 0.15,
              decoration: BoxDecoration(
                color: boxDecorationColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 2)
                ],
              ),
              child: Image(
                image: AssetImage(image),
                width: width * 0.1,
                height: width * 0.1,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: width * 0.04,
            ),
            customText(
              color: blackColor,
              text: title,
              fontSize: width * 0.06,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customText(
                  color: blackColor,
                  text: "$rupeeSymbol ${numberFormatter(spentMoney)}",
                  fontSize: width * 0.06,
                ),
                customText(
                  color: greyColor,
                  text: "${percentage.toStringAsFixed(2)}%",
                  fontSize: width * 0.04,
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(
        color: greyColor,
      ),
    ],
  );
}
