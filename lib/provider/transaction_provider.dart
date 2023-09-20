import 'package:budget_buddy/core/app_export.dart';

class TransactionProvider with ChangeNotifier {
  String currentTrans = currentMonthYear;

  void changeSelectedTransactionMonth(String newMonthYear) {
    currentTrans = newMonthYear;
    notifyListeners();
  }
}
