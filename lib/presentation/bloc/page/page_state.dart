part of 'page_cubit.dart';

class PageState extends Equatable {
  final PagesConvertion page;

  const PageState({this.page = PagesConvertion.criptodolar});

  @override
  List<Object> get props => [page];

  PageState copyWith({PagesConvertion? page}) {
    return PageState(page: page ?? this.page);
  }
}
