import 'package:dolar_hoy/core/network/adapters/http_implementer.dart';
import 'package:dolar_hoy/domain/datasources/monitor_datasource.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/infrastructure/mappers/monitor_mapper.dart';
import 'package:dolar_hoy/infrastructure/models/monitor_model.dart';
import 'package:flutter/material.dart';
import 'package:dolar_hoy/domain/debug/stacktrace.dart';

class MonitorPyDolarVeDatasource extends MonitorDatasource {
  final String connection = 'py-dollar';

  @override
  Future<List<Monitor>> getAll(
    String currency, {
    String page = 'criptodolar',
  }) async {
    try {
      final response = await HttpImplementer.get(
        connection,
        '/$currency',
        queryParameters: {
          'page': page,
          'format_date': 'iso',
          'rounded_price': 'false',
        },
      );

      if (response.statusCode != 200) {
        'Error en la respuesta HTTP: ${response.statusCode}'.log();
        return [];
      }

      if (response.data == null) {
        'La respuesta no contiene datos'.log();
        return [];
      }

      final monitors = MonitorMapper.fromModelToEntity(
        MonitorModel.fromJson(response.data),
        currency,
      );

      'Monitors obtenidos correctamente ${monitors.length} monitores'.log();

      return monitors;
    } catch (e, stackTrace) {
      'Error en MonitorPyDolarVeDatasource.getAll:'.log();
      'Tipo de error: ${e.runtimeType}'.log();
      'Mensaje: $e'.log();
      'Stack trace: $stackTrace'.log();
      return [];
    }
  }
}
