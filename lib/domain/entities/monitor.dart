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
}
