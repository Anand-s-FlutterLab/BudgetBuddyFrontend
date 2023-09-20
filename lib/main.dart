import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/add_income_expense_provider.dart';
import 'package:budget_buddy/provider/analysis_provider.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:budget_buddy/provider/login_provider.dart';
import 'package:budget_buddy/provider/signup_provider.dart';
import 'package:budget_buddy/provider/transaction_provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BudgetBuddy());
}

class BudgetBuddy extends StatelessWidget {
  const BudgetBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<AddIncomeExpenseProvider>(
          create: (context) => AddIncomeExpenseProvider(),
        ),
        ChangeNotifierProvider<TransactionProvider>(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider<AnalysisProvider>(
          create: (context) => AnalysisProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget Buddy',
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
