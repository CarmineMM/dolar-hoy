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

final class SelectDefaultMonitor extends SettingEvent {
  final List<Monitor> monitors;

  const SelectDefaultMonitor({required this.monitors});

  @override
  List<Object> get props => [monitors];

  Monitor get monitor {
    return monitors.firstWhere(
      (monitor) => monitor.name == PagesConvertion.bcv.value,
      orElse: () => monitors.first,
    );
  }
}

final class SettingSetCurrency extends SettingEvent {
  final CurrencyApi currency;

  const SettingSetCurrency({required this.currency});

  @override
  List<Object> get props => [currency];
}
