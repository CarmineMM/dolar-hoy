import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/domain/repositories/monitor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  final MonitorRepository repository;

  MonitorBloc({required this.repository}) : super(MonitorInitial()) {
    on<MonitorGetData>(_onMonitorGetData);
  }

  // Obtener la data
  Future<void> _onMonitorGetData(MonitorGetData event, Emitter<MonitorState> emit) async {
    emit(MonitorLoading());
    try {
      debugPrint('Obteniendo datos para la moneda: ${event.currency}');
      final monitors = await repository.getAll(event.currency);

      if (monitors.isEmpty) {
        emit(const MonitorError(message: 'No se encontraron monitores disponibles'));
        return;
      }

      debugPrint('Datos obtenidos correctamente: ${monitors.length} monitores');
      emit(MonitorLoaded(monitors: monitors));
    } catch (e, stackTrace) {
      debugPrint('Error en _onMonitorGetData:');
      debugPrint('Tipo de error: ${e.runtimeType}');
      debugPrint('Mensaje: $e');
      debugPrint('Stack trace: $stackTrace');

      String errorMessage = 'Error al cargar los datos';
      if (e is FormatException) {
        errorMessage = 'Error en el formato de los datos recibidos';
      } else if (e is TypeError) {
        errorMessage = 'Error de tipo en los datos';
      } else if (e is NoSuchMethodError) {
        errorMessage = 'Error al procesar la respuesta del servidor';
      }

      emit(MonitorError(message: '$errorMessage: ${e.toString()}'));
    }
  }
}
