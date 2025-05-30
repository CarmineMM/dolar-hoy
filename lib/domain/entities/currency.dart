class Currency {
  final String name;
  final String pluralName;
  final String shortName;
  final String symbol;
  final SymbolPosition symbolPosition;
  final String isoCode;
  final String isoNumeric;
  final int decimalDigits;
  final String decimalSeparator;
  final String thousandsSeparator;
  final String flag;

  Currency({
    required this.name,
    required this.pluralName,
    required this.shortName,
    required this.symbol,
    required this.symbolPosition,
    required this.isoCode,
    required this.isoNumeric,
    required this.decimalDigits,
    required this.decimalSeparator,
    required this.thousandsSeparator,
    required this.flag,
  });
}

enum SymbolPosition { before, after, beforeWithSpace, afterWithSpace }
