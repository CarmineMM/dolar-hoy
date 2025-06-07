import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:equatable/equatable.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  final SettingBloc settingBloc;

  ConvertCubit({required this.settingBloc})
    : super(
        ConvertState(
          baseAmount: 1,
          localAmount: _getInitialPrice(settingBloc.state),
          localCurrency: Currency.bolivares(),
        ),
      ) {
    // Listen for state changes in the setting bloc
    settingBloc.stream.listen((state) {
      // if (state is SettingInitial || state is SettingLoaded) {
      //   toLocalCurrency(state.monitor, state.monitor.price);
      // }
    });
  }

  static double _getInitialPrice(SettingState state) {
    if (state is SettingInitial) {
      return state.monitor.price;
    } else if (state is SettingLoaded) {
      return state.monitor.price;
    }
    return 0.0;
  }

  /// Convierte un monto de la moneda del monitor a la moneda local (ej: USD -> VES)
  void toLocalCurrency(Monitor monitor, double baseAmount) {
    emit(state.copyWith(baseAmount: baseAmount, localAmount: baseAmount * monitor.price));
  }

  /// Convierte un monto de la moneda local a la moneda del monitor (ej: VES -> USD)
  void toBaseCurrency(Monitor monitor, double localAmount) {
    emit(state.copyWith(localAmount: localAmount, baseAmount: localAmount / monitor.price));
  }

  void setLocalCurrency(Currency currency) {
    emit(state.copyWith(localCurrency: currency));
  }

  // Reset el monto base y local
  void resetAmount(Monitor monitor) {
    emit(state.copyWith(baseAmount: 1, localAmount: monitor.price));
  }
}
