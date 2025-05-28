import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/datasources/monitor_datasource.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:equatable/equatable.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  final MonitorDatasource datasource;

  MonitorBloc({required this.datasource}) : super(MonitorState()) {
    on<MonitorGetData>(_onGetData);
  }

  // Obtener la data
  Future<void> _onGetData(
    MonitorGetData event,
    Emitter<MonitorState> emit,
  ) async {
    try {
      final monitors = await datasource.getAll(event.currency);

      emit(
        state.copyWith(monitors: {...state.monitors, event.currency: monitors}),
      );
    } catch (e) {
      // Manejo de errores, podrías emitir un estado de error si es necesario
      print('Error fetching monitor data: $e');
    }
  }
}
