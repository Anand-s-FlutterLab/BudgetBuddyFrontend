import 'package:budget_buddy/core/app_export.dart';
import 'package:budget_buddy/provider/home_provider.dart';
import 'package:budget_buddy/provider/transaction_provider.dart';
import 'package:budget_buddy/core/constant/transactionImage.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  customText(
                    text: "Transaction History",
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                          value: transactionProvider.currentTrans,
                          items: homeProvider.monthlyBudget.months.keys
                              .map((String key) => DropdownMenuItem<String>(
                                    value: key,
                                    child: Text(key),
                                  ))
                              .toList(),
                          onChanged: (String? item) {
                            transactionProvider
                                .changeSelectedTransactionMonth(item!);
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
              height: height * 0.69,
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final currentTransaction = homeProvider
                      .monthlyBudget
                      .months[transactionProvider.currentTrans]!
                      .transactions[index];
                  final transactionImage =
                      getTransactionImages(currentTransaction.category);
                  return Container(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: width * 0.15,
                          height: width * 0.15,
                          decoration: BoxDecoration(
                            color: transactionImage["color"],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black26, blurRadius: 2)
                            ],
                          ),
                          child: Image(
                            image: AssetImage(transactionImage["image"]),
                            width: width * 0.1,
                            height: width * 0.1,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        SizedBox(
                          width: width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                color: blackColor,
                                text: currentTransaction.category,
                                fontSize: width * 0.06,
                              ),
                              customText(
                                  color: greyColor,
                                  text: currentTransaction.description,
                                  fontSize: width * 0.04,
                                  maxLines: 3,
                                  textAlign: TextAlign.start),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: customText(
                                  color: currentTransaction.category != "Salary"
                                      ? Colors.red.shade700
                                      : Colors.green.shade700,
                                  text:
                                      "${currentTransaction.category != "Salary" ? "-" : "+"} $rupeeSymbol${numberFormatter(currentTransaction.amount)}",
                                  fontSize: width * 0.05,
                                ),
                              ),
                              customText(
                                color: greyColor,
                                text: currentTransaction.date,
                                fontSize: width * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: homeProvider
                    .monthlyBudget
                    .months[transactionProvider.currentTrans]!
                    .transactions
                    .length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
