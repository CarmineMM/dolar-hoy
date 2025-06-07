part of 'setting_bloc.dart';

final class SettingState extends Equatable {
  final Monitor monitor;
  final PagesConvertion page;
  final CurrencyApi currency;

  SettingState({
    Monitor? monitor,
    this.page = PagesConvertion.bcv,
    this.currency = CurrencyApi.dolar,
  }) : monitor = monitor ?? Monitor.empty();

  @override
  List<Object> get props => [monitor, page, currency];

  SettingState copyWith({Monitor? monitor, PagesConvertion? page, CurrencyApi? currency}) {
    return SettingState(
      monitor: monitor ?? this.monitor,
      page: page ?? this.page,
      currency: currency ?? this.currency,
    );
  }
}
