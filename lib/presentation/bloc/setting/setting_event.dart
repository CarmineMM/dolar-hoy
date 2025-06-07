part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

final class SettingSetMonitor extends SettingEvent {
  final Monitor monitor;

  const SettingSetMonitor({required this.monitor});

  @override
  List<Object> get props => [monitor];
}
