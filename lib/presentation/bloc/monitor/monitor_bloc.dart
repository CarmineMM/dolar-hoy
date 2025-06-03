import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/domain/repositories/monitor_repository.dart';
import 'package:equatable/equatable.dart';

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
      final monitors = await repository.getAll(event.currency);

      emit(MonitorLoaded(monitors: monitors));
    } catch (e) {
      emit(MonitorError(message: e.toString()));
    }
  }
}
