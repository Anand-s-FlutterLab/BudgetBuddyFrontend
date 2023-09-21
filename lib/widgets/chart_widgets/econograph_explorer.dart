import 'dart:math';

import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class EconographExplorerWidget extends StatelessWidget {
  EconographExplorerWidget({super.key});

  late List<String> monthNames;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    int maxY = 0;

    final List<BarChartGroupData> barGroups = [];
    monthNames = homeProvider.monthlyBudget.months.keys.toList();

    for (int i = 0; i < homeProvider.monthlyBudget.months.length; i++) {
      final monthData = homeProvider.monthlyBudget.months[monthNames[i]];
      final barGroup = makeGroupData(
        i,
        monthData!.income.toDouble(),
        monthData.expense.toDouble(),
      );
      barGroups.add(barGroup);
      maxY = max(maxY, monthData.income);
    }

    return SizedBox(
      height: height * 0.5,
      width: width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Expanded(
          child: BarChart(
            BarChartData(
              maxY: maxY.toDouble(),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipRoundedRadius: 12,
                  tooltipBgColor: Colors.deepPurple.shade50,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final income = group.barRods[0].toY;
                    final expense = group.barRods[1].toY;
                    return BarTooltipItem(
                      'Income: $income\nExpense: $expense',
                      AppStyle.textFormFieldStyle(
                        color: primaryColor,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 42,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: barGroups,
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double income, double expense) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: income,
          color: Colors.yellow,
          width: 7,
        ),
        BarChartRodData(
          toY: expense,
          color: Colors.red,
          width: 7,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = changeToMonthYearDate(
      monthYear: monthNames[value.toInt()],
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }
}
