import 'package:intl/intl.dart';

class NumUtils {
  static final _indianRupeesFormat = NumberFormat.currency(
    locale: 'en_IN',
    decimalDigits: 2,
    symbol: '₹ ',
    name: 'INR',
  );

  static String inRupeesFormat(num value) => _indianRupeesFormat.format(value);

  static String toIntFormat(num value) => value.toInt().toString();
}
