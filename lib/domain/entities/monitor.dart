import 'package:dolar_hoy/domain/entities/currency.dart';

class Monitor {
  final Currency currency;
  final String name;
  final String title;
  final String image;
  final double changeAmount;
  final double changePercentage;
  final double price;
  final double? pricePrevious;
  final DateTime? lastUpdate;

  Monitor({
    required this.currency,
    required this.name,
    required this.title,
    required this.image,
    required this.changeAmount,
    required this.changePercentage,
    required this.price,
    required this.pricePrevious,
    required this.lastUpdate,
  });

  String display() {
    return currency.symbol + price.toString();
  }

  Monitor copyWith({
    Currency? currency,
    String? name,
    String? title,
    String? image,
    double? changeAmount,
    double? changePercentage,
    double? price,
    double? pricePrevious,
    DateTime? lastUpdate,
  }) {
    return Monitor(
      currency: currency ?? this.currency,
      name: name ?? this.name,
      title: title ?? this.title,
      image: image ?? this.image,
      changeAmount: changeAmount ?? this.changeAmount,
      changePercentage: changePercentage ?? this.changePercentage,
      price: price ?? this.price,
      pricePrevious: pricePrevious ?? this.pricePrevious,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  static Monitor empty() => Monitor(
    currency: Currency(
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
    ),
    name: 'Empty',
    title: 'Empty',
    image: 'https://flagcdn.com/us.svg',
    changeAmount: 0,
    changePercentage: 0,
    price: 0,
    pricePrevious: null,
    lastUpdate: null,
  );

  @override
  String toString() =>
      '''
        === Entidad: Monitor === 
        currency: $currency,
        name: $name,
        title: $title,
        image: $image,
        changeAmount: $changeAmount,
        changePercentage: $changePercentage,
        price: $price,
        pricePrevious: $pricePrevious,
        lastUpdate: $lastUpdate,
    ''';
}
