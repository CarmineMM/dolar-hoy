import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/domain/repositories/monitor_repository.dart';
import 'package:dolar_hoy/domain/use_cases/adjust_currency_monitors_case.dart';
import 'package:equatable/equatable.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

/// El bloc de monitor contiene la data entera del monitor cargado.
/// Estos monitores vienen la API por ende tienen estados avanzados (Como carga, error, y data).
class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  final MonitorRepository repository;

  MonitorBloc({required this.repository}) : super(MonitorInitial()) {
    on<MonitorGetData>(_onMonitorGetData);
  }

  // Obtener la data
  Future<void> _onMonitorGetData(MonitorGetData event, Emitter<MonitorState> emit) async {
    emit(MonitorLoading());
    try {
      final monitors = await repository.getAll(event.currency, page: event.page);

      if (monitors.isEmpty) {
        emit(const MonitorError(message: 'No se encontraron monitores disponibles'));
        return;
      }

      emit(MonitorLoaded(monitors: AdjustCurrencyMonitorsCase.call(monitors)));
    } catch (e) {
      String errorMessage = 'Error al cargar los datos';

      if (e is FormatException) {
        errorMessage = 'Error en el formato de los datos recibidos';
      } else if (e is TypeError) {
        errorMessage = 'Error de tipo en los datos';
      } else if (e is NoSuchMethodError) {
        errorMessage = 'Error al procesar la respuesta del servidor';
      } else if (e is Exception) {
        errorMessage = e.toString();
      }

      emit(MonitorError(message: errorMessage));
    }
  }
}
