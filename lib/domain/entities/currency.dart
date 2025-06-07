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

  @override
  String toString() =>
      '''
        === Entidad: Currency === 
        name: $name,
        pluralName: $pluralName,
        shortName: $shortName,
        symbol: $symbol,
        symbolPosition: $symbolPosition,
        isoCode: $isoCode,
        isoNumeric: $isoNumeric,
        decimalDigits: $decimalDigits,
        decimalSeparator: $decimalSeparator,
        thousandsSeparator: $thousandsSeparator,
        flag: $flag,
        ==  ==
    ''';

  /// Dolar
  static Currency dolar() => Currency(
    name: 'Dolar',
    pluralName: 'Dolares',
    shortName: 'Dolar',
    symbol: '\$',
    symbolPosition: SymbolPosition.beforeWithSpace,
    isoCode: 'USD',
    isoNumeric: '840',
    decimalDigits: 2,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    flag: 'https://flagcdn.com/us.svg',
  );

  /// Bolivares
  static Currency bolivares() => Currency(
    name: 'Bolivar',
    pluralName: 'Bolivares',
    shortName: 'Bs',
    symbol: 'Bs',
    symbolPosition: SymbolPosition.after,
    isoCode: 'VEF',
    isoNumeric: '937',
    decimalDigits: 2,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    flag: 'https://flagcdn.com/ve.svg',
  );

  /// Euro
  static Currency euro() => Currency(
    name: 'Euro',
    pluralName: 'Euros',
    shortName: 'Euro',
    symbol: '€',
    symbolPosition: SymbolPosition.beforeWithSpace,
    isoCode: 'EUR',
    isoNumeric: '978',
    decimalDigits: 2,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    flag: 'https://flagcdn.com/eu.svg',
  );

  /// Roblo Ruso
  static Currency rublo() => Currency(
    name: 'Rublo',
    pluralName: 'Rublos',
    shortName: 'Rublo',
    symbol: 'RUB',
    symbolPosition: SymbolPosition.beforeWithSpace,
    isoCode: 'RUB',
    isoNumeric: '643',
    decimalDigits: 2,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    flag: 'https://flagcdn.com/ru.svg',
  );

  /// Lira turca
  static Currency lira() => Currency(
    name: 'Lira',
    pluralName: 'Liras',
    shortName: 'Lira',
    symbol: 'TL',
    symbolPosition: SymbolPosition.beforeWithSpace,
    isoCode: 'TRY',
    isoNumeric: '949',
    decimalDigits: 2,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    flag: 'https://flagcdn.com/tr.svg',
  );
}

enum CurrencyApi {
  dolar('Dolar', 'dollar'),
  euro('Euro', 'euro');

  final String title;
  final String apiKey;

  const CurrencyApi(this.title, this.apiKey);
}

enum SymbolPosition { before, after, beforeWithSpace, afterWithSpace }
