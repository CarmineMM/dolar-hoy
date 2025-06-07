import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';

/// Cuando llegan las tasas, en algunos monitors
/// estos traen diversas monedas, la idea es ajustar las monedas según el monitor
class AdjustCurrencyMonitorsCase {
  static List<Monitor> call(List<Monitor> monitors) => monitors.map((monitor) {
    if (monitor.name == 'eur') {
      return monitor.copyWith(currency: Currency.euro());
    }

    return monitor;
  }).toList();
}
