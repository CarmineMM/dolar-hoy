import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/settings/settings_cubit.dart';
import 'package:equatable/equatable.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  final SettingsCubit settingsCubit;

  ConvertCubit({required this.settingsCubit})
    : super(
        ConvertState(
          baseAmount: 1,
          localAmount: settingsCubit.state.monitor.price,
          localCurrency: Currency(
            name: 'Bolivar',
            pluralName: 'Bolivares',
            shortName: 'Bs',
            symbol: 'Bs',
            symbolPosition: SymbolPosition.after,
            isoCode: 'VEF',
            isoNumeric: '937',
            decimalDigits: 2,
            decimalSeparator: '.',
            thousandsSeparator: ',',
            flag: 'https://flagcdn.com/ve.svg',
          ),
        ),
      ) {
    settingsCubit.stream.listen((state) {});
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
