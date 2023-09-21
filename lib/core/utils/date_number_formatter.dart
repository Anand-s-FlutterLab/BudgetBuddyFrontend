import 'package:intl/intl.dart';

String changeToMonthYear({required DateTime dateTime}) {

  String formattedDate = DateFormat('MMMM, yyyy').format(dateTime);
  return formattedDate;
}

String changeToMonthYearDate({required String monthYear}) {
  DateTime dateTime = DateFormat("MMMM, yyyy").parse(monthYear);
  String formattedDate = DateFormat("MM/yy").format(dateTime);
  return formattedDate;
}

String numberFormatter(int amount){
  var f = NumberFormat("#,##,##,###.##", "en_US");
  return f.format(amount);
}