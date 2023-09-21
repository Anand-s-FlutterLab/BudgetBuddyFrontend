class MonthlyBudget {
  String id;
  String userId;
  Map<String, MonthData> months;
  int version;

  MonthlyBudget({
    required this.id,
    required this.userId,
    required this.months,
    required this.version,
  });

  factory MonthlyBudget.fromJson(Map<String, dynamic> json) {
    Map<String, MonthData> monthsData = {};
    if (json.containsKey('months') && json['months'] is Map) {
      final Map<String, dynamic> monthsMap = json['months'];
      monthsMap.forEach((key, value) {
        monthsData[key] = MonthData.fromJson(value);
      });
    }

    return MonthlyBudget(
      id: json['_id'],
      userId: json['user'],
      months: monthsData,
      version: json['__v'],
    );
  }
}

class MonthData {
  int income;
  int expense;
  int housing;
  int transportation;
  int food;
  int utilities;
  int healthcare;
  int entertainment;
  int education;
  int gifts;
  int taxes;
  int miscellaneous;
  List<Transaction> transactions;

  MonthData({
    required this.income,
    required this.expense,
    this.housing = 0,
    this.transportation = 0,
    this.food = 0,
    this.utilities = 0,
    this.healthcare = 0,
    this.entertainment = 0,
    this.education = 0,
    this.gifts = 0,
    this.taxes = 0,
    this.miscellaneous = 0,
    required this.transactions,
  });

  factory MonthData.fromJson(Map<String, dynamic> json) {
    List<Transaction> transactions = [];
    if (json.containsKey('transactions') && json['transactions'] is List) {
      final List<dynamic> transactionsList = json['transactions'];
      transactions = transactionsList.map((t) => Transaction.fromJson(t)).toList();
    }
    return MonthData(
      income: json['income'],
      expense: json['expense'],
      housing: json['Housing'] ?? 0,
      transportation: json['Transportation'] ?? 0,
      food: json['Food'] ?? 0,
      utilities: json['Utilities'] ?? 0,
      healthcare: json['Healthcare'] ?? 0,
      entertainment: json['Entertainment'] ?? 0,
      education: json['Education'] ?? 0,
      gifts: json['Gifts'] ?? 0,
      taxes: json['Taxes'] ?? 0,
      miscellaneous: json['Miscellaneous'] ?? 0,
      transactions: transactions,
    );
  }
}

class Transaction {
  String description;
  String category;
  String date;
  int amount;

  Transaction({
    required this.description,
    required this.category,
    required this.date,
    required this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      description: json['description'],
      category: json['category'],
      date: json['date'],
      amount: json['amount'],
    );
  }
}
