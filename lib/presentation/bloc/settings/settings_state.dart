part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Monitor monitor;

  const SettingsState({required this.monitor});

  @override
  List<Object> get props => [monitor];

  SettingsState copyWith({Monitor? monitor}) => SettingsState(monitor: monitor ?? this.monitor);
}
