import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/settings_old/settings_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/form/convert_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CalculatorConvert extends StatefulWidget {
  const CalculatorConvert({super.key});

  @override
  State<CalculatorConvert> createState() => _CalculatorConvertState();
}

class _CalculatorConvertState extends State<CalculatorConvert> {
  late TextEditingController _baseAmountController;
  late TextEditingController _localAmountController;

  @override
  void initState() {
    super.initState();

    _baseAmountController = TextEditingController();
    _localAmountController = TextEditingController();

    // Valores por default
    final convertState = context.read<ConvertCubit>().state;
    _baseAmountController.text = convertState.baseAmount.toString();
    _localAmountController.text = convertState.localAmount.toString();
  }

  @override
  void dispose() {
    _baseAmountController.dispose();
    _localAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final monitor = context.watch<SettingsCubit>().state.monitor;

    return BlocBuilder<ConvertCubit, ConvertState>(
      builder: (context, convertState) {
        final newBaseAmountText = convertState.baseAmount.toStringAsFixed(2);
        final newLocalAmountText = convertState.localAmount.toStringAsFixed(2);

        if (_baseAmountController.text != newBaseAmountText && !_baseAmountController.selection.isValid) {
          _baseAmountController.text = newBaseAmountText;
        }

        if (_localAmountController.text != newLocalAmountText && !_localAmountController.selection.isValid) {
          _localAmountController.text = newLocalAmountText;
        }

        return Column(
          children: [
            // Monto base (USD, EUR, etc..)
            ConvertTextFormField(
              controller: _baseAmountController,
              monitor: monitor,
              onChanged: context.read<ConvertCubit>().toLocalCurrency,
              resetValues: context.read<ConvertCubit>().resetAmount,
            ),

            const SizedBox(height: 20),

            // Monto local (VES)
            ConvertTextFormField(
              controller: _localAmountController,
              monitor: monitor,
              symbol: convertState.localCurrency.symbol,
              onChanged: context.read<ConvertCubit>().toBaseCurrency,
              hintText: convertState.localCurrency.pluralName,
              resetValues: context.read<ConvertCubit>().resetAmount,
            ),
          ],
        );
      },
    );
  }
}
