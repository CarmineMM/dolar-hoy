part of 'convert_cubit.dart';

class ConvertState extends Equatable {
  final double fromAmount;
  final double toAmount;

  const ConvertState({required this.fromAmount, required this.toAmount});

  @override
  List<Object> get props => [fromAmount, toAmount];
}
