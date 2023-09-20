import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/analysis_provider.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:budget_buddy/widgets/chart_widgets/line_chart.dart';
import 'package:budget_buddy/widgets/chart_widgets/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final analysisProvider = Provider.of<AnalysisProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    final monthData =
        homeProvider.monthlyBudget.months[analysisProvider.currentDate];

    List<String> analysisList = [
      "Monthly Expense Wheel",
      "Econograph Explorer",
      "Savings Spectrum",
      "Balance Waveform",
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  customText(
                    text: "Spending Analysis",
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.9,
                    height: height * 0.071,
                    decoration: AppDecoration.containerBoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(12),
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          ),
                          value: analysisProvider.currentAnalysis,
                          items: analysisList
                              .map((String key) => DropdownMenuItem<String>(
                                    value: key,
                                    child: Text(key),
                                  ))
                              .toList(),
                          onChanged: (String? item) {
                            analysisProvider.changeCurrentAnalysis(item!);
                          },
                          hint: const Text('Select a value'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.9,
                    height: height * 0.071,
                    decoration: AppDecoration.containerBoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(12),
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          ),
                          value: analysisProvider.currentDate,
                          items: homeProvider.monthlyBudget.months.keys
                              .map((String key) => DropdownMenuItem<String>(
                                    value: key,
                                    child: Text(key),
                                  ))
                              .toList(),
                          onChanged: (String? item) {
                            analysisProvider.changeCurrentDate(item!);
                          },
                          hint: const Text('Select a value'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            customText(
              text: analysisProvider.currentAnalysis,
              color: primaryColor,
              fontSize: width * 0.06,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            if (analysisProvider.currentAnalysis == "Balance Waveform")
              const LineChartWidget(),
            PieChartWithTouchIndex(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
