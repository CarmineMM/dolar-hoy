import 'package:dolar_hoy/domain/entities/currency.dart';

class Monitor {
  final Currency currency;
  final String name;
  final String title;
  final String? image;
  final double changeAmount;
  final double changePercentage;
  final double price;
  final double? pricePrevious;
  final String? lastUpdate;

  Monitor(
    this.currency,
    this.name,
    this.title,
    this.image,
    this.changeAmount,
    this.changePercentage,
    this.price,
    this.pricePrevious,
    this.lastUpdate,
  );
}
