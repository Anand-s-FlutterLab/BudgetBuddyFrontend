import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/model/add_income_expense_model.dart';

class AddIncomeExpenseProvider with ChangeNotifier {
  int radioSelectedIndex = -1;
  bool isTransactionAdding = false;
  String selectedCategory = "Select Category";
  String entryMonth = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void changeRadioIndex(int index) {
    radioSelectedIndex = index;
    notifyListeners();
  }

  void changeDropdownItem(String item) {
    selectedCategory = item;
    notifyListeners();
  }

  void toggleEntry() {
    isTransactionAdding = !isTransactionAdding;
    notifyListeners();
  }

  Future<void> addTransaction(
      {required int income, required int expense}) async {
    toggleEntry();
    AddIncomeExpenseModel addIncomeExpenseModel = AddIncomeExpenseModel(
      monthName: entryMonth,
      income: income,
      expense: expense,
      description: descriptionController.text,
      category: radioSelectedIndex == 0 ? "Salary" : selectedCategory,
      amount: int.parse(amountController.text),
      date: dateController.text,
    );
    try {
      Response response = await Dio().put(
        "$baseUrl/$incomeExpenseRoute",
        options: Options(
          headers: {"Authorization": authToken},
        ),
        data: addIncomeExpenseModel.toJson(),
      );
      Get.back();
      customSnackBar("Success", "Transaction Added Successfully", "green");
      clearData();
    } on DioException catch (err) {
      customSnackBar("Error", "${err.response?.data}");
    } finally {
      toggleEntry();
    }
  }

  void clearData() {
    radioSelectedIndex = -1;
    selectedCategory = "Select Category";
    entryMonth = "";
    dateController.clear();
    amountController.clear();
    descriptionController.clear();
  }
}
