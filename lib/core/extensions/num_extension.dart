import 'package:intl/intl.dart' as intl;

extension Extensions on num? {
  bool get isNullOrZero => this == null || this! == 0;

  String numberFormat([String? currencyShortcut]) => _formatted + ((currencyShortcut == null) ? '' : ' $currencyShortcut');

  String get _formatted {
    if (this == null) return 'null';
    return intl.NumberFormat('###,##0.00').format(this);
  }
}
