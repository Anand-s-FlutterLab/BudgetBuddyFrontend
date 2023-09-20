import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/analysis_provider.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final analysisProvider = Provider.of<AnalysisProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    final monthData =
        homeProvider.monthlyBudget.months[analysisProvider.currentDate];
    List<int> amountList = analysisProvider.getAmountList(monthData!);

    return SizedBox(
      height: height * 0.4,
      width: width * 0.9,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: true,
            touchCallback:
                (FlTouchEvent event, LineTouchResponse? touchResponse) {},
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: primaryColor,
              tooltipRoundedRadius: 8.0,
              showOnTopOfTheChartBoxArea: true,
              fitInsideHorizontally: true,
              tooltipMargin: 0,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map(
                  (LineBarSpot touchedSpot) {
                    const textStyle = TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    );
                    return LineTooltipItem(
                      touchedSpot.y.toStringAsFixed(2),
                      // Use touchedSpot to access y-value
                      textStyle,
                    );
                  },
                ).toList();
              },
            ),
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> indicators) {
              return indicators.map(
                (int index) {
                  const line = FlLine(
                    color: Colors.grey,
                    strokeWidth: 1,
                    dashArray: [2, 4],
                  );
                  return const TouchedSpotIndicatorData(
                    line,
                    FlDotData(show: false),
                  );
                },
              ).toList();
            },
            getTouchLineEnd: (_, __) => double.infinity,
          ),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(
                color: Color(0xff37434d),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xff37434d),
                width: 1,
              ),
            ),
          ),
          minX: 0,
          maxX: amountList.length.toDouble(),
          minY: 0,
          maxY: amountList.reduce((a, b) => a > b ? a : b).toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: amountList.asMap().entries.map((entry) {
                return FlSpot(
                  entry.key.toDouble(),
                  entry.value.toDouble(),
                );
              }).toList(),
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.deepPurpleAccent,
                ],
              ),
              color: primaryColor,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(0.4),
                    Colors.deepPurpleAccent.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 10),
        curve: Curves.bounceIn,
      ),
    );
  }
}
