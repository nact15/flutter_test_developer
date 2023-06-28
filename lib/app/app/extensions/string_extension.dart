import 'package:intl/intl.dart';

extension StringExtension on String {
  String get capitalizeFirst {
    if (length >= 1) return this[0].toUpperCase() + substring(1);

    return this;
  }

  String get formatCarNumber {
    final number = replaceAll(' ', '');
    if (number.length >= 6) {
      return number.substring(0, 6).toLowerCase();
    }

    return this;
  }

  String get formatCarRegion {
    final number = replaceAll(' ', '');
    if (number.length >= 6) {
      return number.substring(6);
    }

    return this;
  }

  List<String> get formatCarMiles {
    if (length >= 7) {
      return substring(7).split('');
    }

    return split('');
  }

  String get removeHtml {
    return Bidi.stripHtmlIfNeeded(this);
  }
}
