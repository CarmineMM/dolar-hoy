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
    try {
      final response = await HttpImplementer.get(
        connection,
        '/$currency',
        queryParameters: {'page': page, 'format_date': 'iso', 'rounded_price': 'false'},
      );

      if (response.statusCode != 200) {
        debugPrint('Error en la respuesta HTTP: ${response.statusCode}');
        debugPrint('Datos de respuesta: ${response.data}');
        return [];
      }

      if (response.data == null) {
        debugPrint('La respuesta no contiene datos');
        return [];
      }

      final monitors = MonitorMapper.fromModelToEntity(MonitorModel.fromJson(response.data), currency);
      return monitors;
    } catch (e, stackTrace) {
      debugPrint('Error en MonitorPyDolarVeDatasource.getAll:');
      debugPrint('Tipo de error: ${e.runtimeType}');
      debugPrint('Mensaje: $e');
      debugPrint('Stack trace: $stackTrace');
      return [];
    }
  }
}
