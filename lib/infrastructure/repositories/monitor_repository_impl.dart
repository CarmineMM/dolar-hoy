import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/domain/repositories/monitor_repository.dart';

class MonitorRepositoryImpl extends MonitorRepository {
  MonitorRepositoryImpl(super.datasource);

  @override
  Future<List<Monitor>> getAll(String currency, {String page = 'criptodolar'}) {
    return datasource.getAll(currency, page: page);
  }
}
