import 'package:budget_buddy/core/app_export.dart';

Map<String, dynamic> getTransactionImages(String name) {
  switch (name) {
    case "Housing":
      return {
        "color": Colors.yellow.shade100,
        "image": homeListHouse,
      };
    case "Transportation":
      return {
        "color": Colors.blue.shade50,
        "image": homeListTransportation,
      };
    case "Food":
      return {
        "color": Colors.red.shade50,
        "image": homeListFood,
      };
    case "Utilities":
      return {
        "color": Colors.grey.shade200,
        "image": homeListUtilities,
      };
    case "Healthcare":
      return {
        "color": Colors.green.shade500,
        "image": homeListHealthcare,
      };
    case "Entertainment":
      return {
        "color": Colors.pink.shade50,
        "image": homeListEntertainment,
      };
    case "Education":
      return {
        "color": Colors.blueGrey.shade100,
        "image": homeListEducation,
      };
    case "Gifts":
      return {
        "color": Colors.red.shade50,
        "image": homeListGifts,
      };
    case "Taxes":
      return {
        "color": Colors.purple.shade50,
        "image": homeListTaxes,
      };
    case "Miscellaneous":
      return {"color": Colors.yellow.shade100, "image": homeListMiscellaneous};
    case "Salary":
      return {
        "color": Colors.green.shade50,
        "image": homeListSalary,
      };
    default:
      return {
        "color": Colors.black12,
        "image": cardBackgroundImage,
      };
  }
}
