part of 'monitor_bloc.dart';

class MonitorState extends Equatable {
  final Map<String, List<Monitor>> monitors;

  const MonitorState({this.monitors = const {}});

  @override
  List<Object> get props => [monitors];

  MonitorState copyWith({Map<String, List<Monitor>>? monitors}) =>
      MonitorState(monitors: monitors ?? this.monitors);
}
