import 'package:budget_buddy/model/income_expense_model.dart';
import 'package:budget_buddy/core/app_export.dart';

class HomeProvider with ChangeNotifier {
  bool isGettingUserIncomeExpense = false;
  late MonthlyBudget monthlyBudget;
  bool isMonthlyBudgetEmpty = false;

  Future<void> getUserIncomeExpense() async {
    gettingDataToggle();
    try {
      Response userData = await Dio().get(
        "$baseUrl/$incomeExpenseRoute",
        options: Options(
          headers: {"Authorization": authToken},
        ),
      );
      if (userData.data == null) {
        isMonthlyBudgetEmpty = true;
      } else {
        isMonthlyBudgetEmpty = false;
        monthlyBudget = MonthlyBudget.fromJson(userData.data);
      }
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      gettingDataToggle();
    }
  }

  void gettingDataToggle() {
    isGettingUserIncomeExpense = !isGettingUserIncomeExpense;
    notifyListeners();
  }
}
