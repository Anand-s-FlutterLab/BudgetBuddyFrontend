import 'package:intl/intl.dart';

String getMonthYear({required DateTime dateTime}) {

  String formattedDate = DateFormat('MMMM, yyyy').format(dateTime);
  return formattedDate;
}