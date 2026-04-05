import 'package:intl/intl.dart';

extension StringFormatExtension on String? {
  String toBigNumberFormat() {
    if (this == null || this!.isEmpty) return 'N/A';
    final cleanString = this!.replaceAll(RegExp(r'[^0-9.]'), '');
    final number = double.tryParse(cleanString);
    if (number == null) return this!;

    if (number >= 1000000000) {
      return '\$${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '\$${(number / 1000000).toStringAsFixed(1)}M';
    }
    return '\$${number.toStringAsFixed(0)}';
  }
}

extension PriceFormatExtension on double? {
  String toPriceFormat() {
    if (this == null) return 'N/A';
    if (this! < 0.01) {
      return '\$${this!.toStringAsFixed(6)}';
    }
    final formatCurrency = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatCurrency.format(this);
  }
}
