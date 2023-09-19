class AddIncomeExpenseModel {
  String monthName;
  int income;
  int expense;
  String description;
  String category;
  int amount;
  String date;

  AddIncomeExpenseModel({
    required this.monthName,
    required this.income,
    required this.expense,
    required this.description,
    required this.category,
    required this.amount,
    required this.date,
  });

  factory AddIncomeExpenseModel.fromJson(Map<String, dynamic> json) => AddIncomeExpenseModel(
    monthName: json["monthName"],
    income: json["income"],
    expense: json["expense"],
    description: json["description"],
    category: json["category"],
    amount: json["amount"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "monthName": monthName,
    "income": income,
    "expense": expense,
    "description": description,
    "category": category,
    "amount": amount,
    "date": date,
  };
}
