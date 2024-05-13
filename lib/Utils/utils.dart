import 'package:intl/intl.dart';

String formatMoney(double amount) {
  // Create a NumberFormat instance for the locale
  final formatter = NumberFormat.currency(locale: 'fr_FR', symbol: 'DH');

  // Format the double into a currency string
  return formatter.format(amount);
}
