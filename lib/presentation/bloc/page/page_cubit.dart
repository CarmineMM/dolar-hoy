import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState());

  void setPage(String page) => emit(state.copyWith(pageName: page));
}
