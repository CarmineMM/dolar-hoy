import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/infrastructure/mappers/currency_mapper.dart';
import 'package:dolar_hoy/infrastructure/models/monitor_model.dart';

class MonitorMapper {
  static List<Monitor> fromModelToEntity(MonitorModel model, String currency) {
    final currencyEntity = CurrencyMapper.getUsd();

    return model.monitors.entries
        .map(
          (entry) => Monitor(
            name: entry.key,
            title: entry.value.title,
            price: entry.value.price,
            image:
                entry.value.image ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAAja6c9Ip37JMYpOmIIe9JGv16LvccS2OoCpr2Evz5Gv2-ImNwePvBoxNWctyWlJwYmA&usqp=CAU',
            changeAmount: entry.value.change,
            changePercentage: entry.value.percent,
            lastUpdate: entry.value.lastUpdate,
            pricePrevious: entry.value.priceOld,
            currency: currencyEntity,
          ),
        )
        .toList();
  }
}
