part of 'monitor_bloc.dart';

sealed class MonitorEvent extends Equatable {
  const MonitorEvent();

  @override
  List<Object> get props => [];
}

class MonitorGetData extends MonitorEvent {
  final String currency;

  const MonitorGetData({required this.currency});

  @override
  List<Object> get props => [currency];
}
