// This class is a placeholder for the actual implementation of the Datasource.
// It should contain methods to fetch monitor data from the PyDolar API or any other source.
import 'package:dolar_hoy/domain/entities/monitor.dart';

abstract class MonitorPyDolarDatasource {
  Future<List<Monitor>> getAll(String currency);
}
