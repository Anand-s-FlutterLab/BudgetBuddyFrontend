import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/core/utils/date_utils.dart';
import 'package:budget_buddy/model/add_income_expense_model.dart';
import 'package:budget_buddy/provider/add_income_expense_provider.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:intl/intl.dart';

class AddIncomeExpenseScreen extends StatelessWidget {
  const AddIncomeExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = [
      "Select Category",
      "Housing",
      "Transportation",
      "Food",
      "Utilities",
      "Healthcare",
      "Entertainment",
      "Education",
      "Gifts",
      "Taxes",
      "Miscellaneous",
    ];

    final addProvider = Provider.of<AddIncomeExpenseProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              customText(
                text: "Transaction Entry",
                color: blackColor,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.07,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customRadioList(
                    addProvider: addProvider,
                    value: 0,
                    text: "Income",
                  ),
                  customRadioList(
                    addProvider: addProvider,
                    value: 1,
                    text: "Expense",
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              if(addProvider.radioSelectedIndex == 1)
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
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      value: addProvider.selectedCategory,
                      items: dropdownItems
                          .map((String key) => DropdownMenuItem<String>(
                                value: key,
                                child: Text(key),
                              ))
                          .toList(),
                      onChanged: (String? item) {
                        addProvider.changeDropdownItem(item!);
                      },
                      hint: const Text('Select a value'),
                    ),
                  ),
                ),
              ),
              if(addProvider.radioSelectedIndex == 1)
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  children: [
                    Container(
                      decoration: AppDecoration.inputBoxDecorationShadow(),
                      child: TextFormField(
                        controller: addProvider.dateController,
                        decoration: AppDecoration().textInputDecoration(
                          lableText: "Select Date",
                          icon: Icons.calendar_month_rounded,
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: primaryColor,
                                    onPrimary: Colors.white,
                                    surface: primaryColor,
                                    onSurface: primaryColor,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            addProvider.dateController.text = formattedDate;
                            addProvider.entryMonth =
                                getMonthYear(dateTime: pickedDate);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                      decoration: AppDecoration.inputBoxDecorationShadow(),
                      child: TextFormField(
                        controller: addProvider.amountController,
                        decoration: AppDecoration().textInputDecoration(
                          icon: Icons.money_rounded,
                          lableText: "Amount",
                          hintText: "Enter Amount Here",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                      decoration: AppDecoration.inputBoxDecorationShadow(),
                      child: TextFormField(
                        controller: addProvider.descriptionController,
                        maxLines: null,
                        decoration: AppDecoration().textInputDecoration(
                          icon: Icons.description_outlined,
                          lableText: "Description",
                          hintText: "Enter Description Here",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        int currentIncome = homeProvider.monthlyBudget
                                .months[addProvider.entryMonth]?.income ??
                            0;
                        int currentExpense = homeProvider.monthlyBudget
                                .months[addProvider.entryMonth]?.expense ??
                            0;
                        int amount = int.parse(addProvider.amountController.text);

                        addProvider.addTransaction(
                          income: addProvider.radioSelectedIndex == 0
                              ? currentIncome + amount
                              : currentIncome,
                          expense: addProvider.radioSelectedIndex == 1
                              ? currentExpense - amount
                              : currentExpense,
                        );
                      },
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        decoration: AppDecoration.buttonBoxDecoration(),
                        child: addProvider.isTransactionAdding
                            ? customButtonLoadingAnimation(size: width * 0.1)
                            : customText(
                                text: "Add Entry",
                                color: Colors.white,
                                fontSize: width * 0.08,
                              ), // Display "Login" text
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customRadioList({
  required final addProvider,
  required int value,
  required String text,
}) {
  return SizedBox(
    width: width * 0.45,
    child: ListTile(
      minLeadingWidth: 0,
      title: customText(
          text: text,
          fontSize: width * 0.05,
          fontWeight: FontWeight.w500,
          color: addProvider.radioSelectedIndex == value
              ? primaryColor
              : Colors.black,
          textAlign: TextAlign.start),
      leading: Radio<int>(
        value: value,
        groupValue: addProvider.radioSelectedIndex,
        activeColor: primaryColor,
        splashRadius: 20,
        onChanged: (int? value) {
          addProvider.changeRadioIndex(value!);
        },
      ),
    ),
  );
}
