part of 'page_cubit.dart';

class PageState extends Equatable {
  final PagesConvertion page;
  final String currency;

  const PageState({this.page = PagesConvertion.criptodolar, this.currency = 'dollar'});

  @override
  List<Object> get props => [page];

  PageState copyWith({PagesConvertion? page, String? currency}) {
    return PageState(page: page ?? this.page, currency: currency ?? this.currency);
  }
}
