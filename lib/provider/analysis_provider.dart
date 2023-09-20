import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/model/income_expense_model.dart';

class AnalysisProvider with ChangeNotifier {
  String currentAnalysis = "Monthly Expense Wheel";
  String currentDate = currentMonthYear;
  int pieTouchedIndex = -1;

  void changeCurrentAnalysis(String newAnalysis) {
    currentAnalysis = newAnalysis;
    notifyListeners();
  }

  void changeCurrentDate(String newMonthYear) {
    currentDate = newMonthYear;
    notifyListeners();
  }

  void changePieTouchedIndex(int newTouchIndex) {
    pieTouchedIndex = newTouchIndex;
    print(pieTouchedIndex);
    notifyListeners();
  }

  List<int> getAmountList(MonthData monthData) {
    List<int> amountList = [];
    int currentAmount = 0;
    for (Transaction transaction in monthData.transactions) {
      if (transaction.category == "Salary") {
        currentAmount += transaction.amount;
        amountList.add(currentAmount);
      } else {
        currentAmount -= transaction.amount;
        amountList.add(currentAmount);
      }
      print("${transaction.category} ${transaction.amount}");
    }
    print(amountList);
    return amountList;
  }
}
