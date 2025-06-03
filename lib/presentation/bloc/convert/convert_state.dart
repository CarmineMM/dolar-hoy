part of 'convert_cubit.dart';

class ConvertState extends Equatable {
  /// Moneda base que viene del monitor (USD - EUR - etc...)
  final double baseAmount;

  /// Moneda local a la que se convierte de la moneda base ej; USD -> VES, EUR -> VES, etc...
  final double localAmount;

  /// Moneda local (Inicialmente sera VES)
  final Currency localCurrency;

  const ConvertState({required this.baseAmount, required this.localAmount, required this.localCurrency});

  @override
  List<Object> get props => [baseAmount, localAmount, localCurrency];

  ConvertState copyWith({double? baseAmount, double? localAmount, Currency? localCurrency}) {
    return ConvertState(
      baseAmount: baseAmount ?? this.baseAmount,
      localAmount: localAmount ?? this.localAmount,
      localCurrency: localCurrency ?? this.localCurrency,
    );
  }

  @override
  String toString() {
    return '''
      === Cubic State: ConvertState
        baseAmount: $baseAmount
        localAmount: $localAmount
        localCurrency: $localCurrency
      ''';
  }
}
