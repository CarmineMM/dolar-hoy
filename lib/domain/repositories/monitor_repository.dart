import 'package:dolar_hoy/domain/datasources/monitor_datasource.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';

abstract class MonitorRepository {
  final MonitorDatasource datasource;

  MonitorRepository(this.datasource);

  Future<List<Monitor>> getAll(String currency, {String page = 'criptodolar'});
}
