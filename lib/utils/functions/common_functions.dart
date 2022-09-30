import 'package:intl/intl.dart';
import 'package:train_venturo/modules/models/order_model.dart/order_list_by_iduser_model.dart';

class CommonFunctions {
  // final formatCurrency = NumberFormat.decimalPattern();
  String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  String convertDate(String date, String format) {
    var dateFormat = DateFormat('yyyy-MM-dd');

    var formattedDate = dateFormat.parse(date);

    var outputFormat = DateFormat(format);
    var outputDate = outputFormat.format(formattedDate);

    return outputDate;
  }

  String getListMenuName(List<Menu> data) {
    List<String> result = data.map((Menu e) {
      return e.nama ?? "";
    }).toList();

    return result.join(", ");
  }
}
