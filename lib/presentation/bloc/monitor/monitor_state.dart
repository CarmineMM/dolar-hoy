part of 'monitor_bloc.dart';

abstract class MonitorState extends Equatable {
  const MonitorState();

  @override
  List<Object> get props => [];

  // MonitorState copyWith({List<Monitor>? monitors}) => MonitorState(monitors: monitors ?? this.monitors);
}

// Estado inicial sin monitores cargados
class MonitorInitial extends MonitorState {}

class MonitorLoading extends MonitorState {}

class MonitorLoaded extends MonitorState {
  final List<Monitor> monitors;

  const MonitorLoaded({required this.monitors});

  @override
  List<Object> get props => [monitors];
}

class MonitorError extends MonitorState {
  final String message;

  const MonitorError({required this.message});

  @override
  List<Object> get props => [message];
}
