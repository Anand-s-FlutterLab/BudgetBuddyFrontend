import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/core/constant/home_listview_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
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
                    text: "Hello Anand",
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  Container(
                    height: width * 0.12,
                    width: width * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://cdn3d.iconscout.com/3d/premium/thumb/profile-6335655-5220669.png?f=webp",
                        ),
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
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(10, 10),
                    )
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://cdn.wallpapersafari.com/81/23/Cwk3He.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardRowTextBuilder(
                        text1: "Your Balance",
                        text2: "December, 2023",
                        fontSize1: width * 0.06),
                    customText(
                      color: whiteColor,
                      text: "₹ 15,000",
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.1,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cardColumnTextBuilder(
                          text1: "Spent",
                          text2: "₹ 5000",
                        ),
                        cardColumnTextBuilder(
                          text1: "Available",
                          text2: "₹ 300",
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
            Align(
              alignment: Alignment.center,
              child: customText(
                color: blackColor,
                fontWeight: FontWeight.w500,
                fontSize: width * 0.08,
                text: "Monthly Expenditure",
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20, right: 20),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  height: height * 0.1,
                  width: width,
                  decoration: AppDecoration.containerBoxDecoration(),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.15,
                        height: width * 0.15,
                        decoration: BoxDecoration(
                          color: homeListViewItems[index].color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image(
                          image: AssetImage(homeListViewItems[index].image),
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
                        text: homeListViewItems[index].title,
                        fontSize: width * 0.06,
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(
                            color: blackColor,
                            text: "Hello",
                            fontSize: width * 0.07,
                          ),
                          customText(
                            color: greyColor,
                            text: "20%",
                            fontSize: width * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: homeListViewItems.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.02);
              },
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      ),
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
