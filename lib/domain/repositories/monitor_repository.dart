import 'package:dolar_hoy/domain/entities/monitor.dart';

abstract class MonitorRepository {
  Future<List<Monitor>> getAll(String currency);
}
