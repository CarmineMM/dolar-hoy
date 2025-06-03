import 'package:dolar_hoy/core/network/adapters/http_implementer.dart';
import 'package:dolar_hoy/domain/datasources/monitor_datasource.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/infrastructure/mappers/monitor_mapper.dart';
import 'package:dolar_hoy/infrastructure/models/monitor_model.dart';
import 'package:flutter/material.dart';

class MonitorPyDolarVeDatasource extends MonitorDatasource {
  final String connection = 'py-dollar';

  @override
  Future<List<Monitor>> getAll(String currency, {String page = 'criptodolar'}) async {
    final response = await HttpImplementer.get(
      connection,
      '/$currency',
      queryParameters: {'page': page, 'format_date': 'iso', 'rounded_price': 'false'},
    );

    if (response.statusCode != 200 || response.data == null) {
      return [];
    }

    final monitors = MonitorMapper.fromModelToEntity(MonitorModel.fromJson(response.data), currency);

    return monitors;
  }
}
