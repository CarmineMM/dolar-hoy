import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  ConvertCubit() : super(ConvertState(fromAmount: 0, toAmount: 0));
}
