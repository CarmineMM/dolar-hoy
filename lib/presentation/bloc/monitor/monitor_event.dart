part of 'monitor_bloc.dart';

sealed class MonitorEvent extends Equatable {
  const MonitorEvent();

  @override
  List<Object> get props => [];
}

class MonitorGetData extends MonitorEvent {
  final String currency;
  final String page;

  const MonitorGetData({required this.currency, required this.page});

  @override
  List<Object> get props => [currency, page];
}
