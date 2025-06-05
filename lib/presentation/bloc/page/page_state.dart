part of 'page_cubit.dart';

class PageState extends Equatable {
  final PagesConvertion page;
  final CurrencyApi currency;

  const PageState({this.page = PagesConvertion.criptodolar, this.currency = CurrencyApi.dolar});

  @override
  List<Object> get props => [page, currency];

  PageState copyWith({PagesConvertion? page, CurrencyApi? currency}) {
    return PageState(page: page ?? this.page, currency: currency ?? this.currency);
  }
}
