part of 'page_cubit.dart';

class PageState extends Equatable {
  final String pageName;

  const PageState({this.pageName = 'criptodolar'});

  @override
  List<Object> get props => [pageName];

  PageState copyWith({String? pageName}) {
    return PageState(pageName: pageName ?? this.pageName);
  }
}
