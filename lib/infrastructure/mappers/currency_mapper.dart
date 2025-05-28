import 'package:dolar_hoy/domain/entities/currency.dart';

class CurrencyMapper {
  static Currency getUsd() {
    return Currency(
      name: 'Dolar Americano',
      pluralName: 'Dolares Americanos',
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
  }
}
