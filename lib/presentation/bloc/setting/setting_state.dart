part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {
  final Monitor monitor;
  final PagesConvertion page;

  SettingInitial()
    : monitor = Monitor(
        currency: Currency.dolar(),
        name: 'Dolar',
        title: 'Cargando...',
        image: '',
        changeAmount: 0,
        changePercentage: 0,
        price: 0,
      ),
      page = PagesConvertion.bcv;

  @override
  List<Object> get props => [monitor, page];
}

final class SettingLoaded extends SettingState {
  final Monitor monitor;
  final PagesConvertion page;
  final CurrencyApi currency;

  const SettingLoaded({required this.monitor, required this.page, required this.currency});

  @override
  List<Object> get props => [monitor, page, currency];
}
