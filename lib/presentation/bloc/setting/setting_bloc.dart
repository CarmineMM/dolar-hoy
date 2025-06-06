import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:equatable/equatable.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {});
  }
}
