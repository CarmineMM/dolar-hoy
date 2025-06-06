part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {
  const SettingInitial();
}

final class SettingLoaded extends SettingState {
  final Monitor monitor;
  final PagesConvertion page;
  final CurrencyApi currency;

  const SettingLoaded({required this.monitor, required this.page, required this.currency});

  @override
  List<Object> get props => [monitor, page, currency];
}
