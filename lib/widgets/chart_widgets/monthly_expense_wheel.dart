import 'package:budget_buddy/provider/analysis_provider.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:budget_buddy/core/app_export.dart';

class MonthlyExpenseWheelWidget extends StatelessWidget {
  const MonthlyExpenseWheelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final analysisProvider = Provider.of<AnalysisProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    var currentMonthData =
        homeProvider.monthlyBudget.months[analysisProvider.currentDate]!;
    return SizedBox(
      height: height * 0.5,
      width: width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Transform.scale(
              scale: width * 0.003,
              child: PieChart(
                PieChartData(
                  sections: List.generate(10, (i) {
                    final isTouched = i == analysisProvider.pieTouchedIndex;
                    final titlePosition = isTouched ? 0.5 : 1.5;
                    final fontSize = width * 0.04;
                    final radius = isTouched ? 60.0 : 50.0;

                    switch (i) {
                      case 0:
                        final value = valueCalculator(
                          value: currentMonthData.housing,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[0],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[0],
                          ),
                        );
                      case 1:
                        final value = valueCalculator(
                          value: currentMonthData.transportation,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[1],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[1],
                          ),
                        );
                      case 2:
                        final value = valueCalculator(
                          value: currentMonthData.food,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[2],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[2],
                          ),
                        );
                      case 3:
                        final value = valueCalculator(
                          value: currentMonthData.utilities,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[3],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[3],
                          ),
                        );
                      case 4:
                        final value = valueCalculator(
                          value: currentMonthData.healthcare,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[4],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? blackColor : pieChartColors[4],
                          ),
                        );
                      case 5:
                        final value = valueCalculator(
                          value: currentMonthData.entertainment,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[5],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? blackColor : pieChartColors[5],
                          ),
                        );
                      case 6:
                        final value = valueCalculator(
                          value: currentMonthData.education,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[6],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[6],
                          ),
                        );
                      case 7:
                        final value = valueCalculator(
                          value: currentMonthData.gifts,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[7],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? whiteColor : pieChartColors[7],
                          ),
                        );
                      case 8:
                        final value = valueCalculator(
                          value: currentMonthData.taxes,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[8],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? blackColor : pieChartColors[8],
                          ),
                        );
                      case 9:
                        final value = valueCalculator(
                          value: currentMonthData.miscellaneous,
                          expense: currentMonthData.expense,
                        );
                        return PieChartSectionData(
                          color: pieChartColors[9],
                          value: value == 0 ? 0.01 : value,
                          title: value == 0 ? "" : value.toStringAsFixed(2),
                          radius: radius,
                          titlePositionPercentageOffset: titlePosition,
                          titleStyle: AppStyle.textFormFieldStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                            color: isTouched ? blackColor : pieChartColors[9],
                          ),
                        );
                      default:
                        throw Error();
                    }
                  }),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        analysisProvider.changePieTouchedIndex(-1);
                        return;
                      }
                      analysisProvider.changePieTouchedIndex(
                          pieTouchResponse.touchedSection!.touchedSectionIndex);
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ),
          Wrap(
            children: [
              indicator(
                color1: pieChartColors[0],
                text1: dropdownItems[1],
                color2: pieChartColors[1],
                text2: dropdownItems[2],
              ),
              indicator(
                color1: pieChartColors[2],
                text1: dropdownItems[3],
                color2: pieChartColors[3],
                text2: dropdownItems[4],
              ),
              indicator(
                color1: pieChartColors[4],
                text1: dropdownItems[5],
                color2: pieChartColors[5],
                text2: dropdownItems[6],
              ),
              indicator(
                color1: pieChartColors[6],
                text1: dropdownItems[7],
                color2: pieChartColors[7],
                text2: dropdownItems[8],
              ),
              indicator(
                color1: pieChartColors[8],
                text1: dropdownItems[9],
                color2: pieChartColors[9],
                text2: dropdownItems[10],
              ),
            ],
          )
        ],
      ),
    );
  }
}

double valueCalculator({required int expense, required int value}) {
  return ((value * 100) / expense);
}

Widget indicator({
  required Color color1,
  required Color color2,
  required String text1,
  required String text2,
  double size = 16,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: color1,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text1,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: color1,
            ),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Text(
            text2,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: color2,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: color2,
            ),
          ),
        ],
      ),
    ],
  );
}
