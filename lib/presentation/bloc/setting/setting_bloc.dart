import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:equatable/equatable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<SelectDefaultMonitor>(_selectDefaultMonitor);
    on<SettingSetMonitor>(_settingSetMonitor);
    on<SettingSetPage>(_settingSetPage);
  }

  /// Establece el monitor por default
  void _selectDefaultMonitor(SelectDefaultMonitor event, Emitter<SettingState> emit) {
    emit(state.copyWith(monitor: event.monitor));
  }

  void _settingSetMonitor(SettingSetMonitor event, Emitter<SettingState> emit) {
    emit(state.copyWith(monitor: event.monitor));
  }

  void _settingSetPage(SettingSetPage event, Emitter<SettingState> emit) {
    emit(state.copyWith(page: event.page));
  }
}
