import 'dart:ui';

import 'package:intl/intl.dart';

import 'localization_extension.dart';

extension NumExtension on num {
  String get numberFormatter {
    if (this >= 1000) {
      final formatter = NumberFormat('###,000');

      return formatter.format(this).replaceAll(',', ' ');
    }

    return '$this';
  }

  String formatCurrency(String? currencySymbol) {
    final String price = numberFormatter;
    if (currencySymbol != null) {
      return '$price $currencySymbol';
    }

    return price;
  }

  String formatCurrencyLocalized(AppLocalizations localizations) {
    final String price = numberFormatter;

    return '$price ${localizations.currencySymbol}';
  }

  List<String> get formatMileage {
    String stringMileage = toString();

    return stringMileage.split('');
  }
}
