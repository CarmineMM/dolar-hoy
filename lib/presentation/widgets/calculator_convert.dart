import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
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
  late FocusNode _baseFocusNode;
  late FocusNode _localFocusNode;

  @override
  void initState() {
    super.initState();

    _baseAmountController = TextEditingController();
    _localAmountController = TextEditingController();
    _baseFocusNode = FocusNode();
    _localFocusNode = FocusNode();

    // Valores por default (establecerlos solo una vez al inicio)
    final convertState = context.read<ConvertCubit>().state;
    _baseAmountController.text = convertState.baseAmount.toStringAsFixed(2);
    _localAmountController.text = convertState.localAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _baseAmountController.dispose();
    _localAmountController.dispose();
    _baseFocusNode.dispose();
    _localFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final monitor = context.watch<SettingBloc>().state.monitor;

    return BlocBuilder<ConvertCubit, ConvertState>(
      builder: (context, convertState) {
        final newBaseAmountText = convertState.baseAmount.toStringAsFixed(2);
        final newLocalAmountText = convertState.localAmount.toStringAsFixed(2);

        // Lógica para actualizar los controladores de forma reactiva
        // Solo actualizamos el campo que NO tiene el foco
        // y solo si el texto del controlador es diferente al nuevo valor del estado.

        // Si el foco NO está en el campo base Y el texto actual es diferente al del estado
        if (!_baseFocusNode.hasFocus && _baseAmountController.text != newBaseAmountText) {
          final currentSelection = _baseAmountController.selection;
          _baseAmountController.text = newBaseAmountText;
          // Intentar mantener la posición del cursor si es posible
          try {
            _baseAmountController.selection = currentSelection.copyWith(
              baseOffset: currentSelection.baseOffset.clamp(0, newBaseAmountText.length),
              extentOffset: currentSelection.extentOffset.clamp(0, newBaseAmountText.length),
            );
          } catch (e) {
            // Fallback: mover el cursor al final si hay un error
            _baseAmountController.selection = TextSelection.fromPosition(
              TextPosition(offset: _baseAmountController.text.length),
            );
          }
        }

        // Si el foco NO está en el campo local Y el texto actual es diferente al del estado
        if (!_localFocusNode.hasFocus && _localAmountController.text != newLocalAmountText) {
          final currentSelection = _localAmountController.selection;
          _localAmountController.text = newLocalAmountText;
          // Intentar mantener la posición del cursor si es posible
          try {
            _localAmountController.selection = currentSelection.copyWith(
              baseOffset: currentSelection.baseOffset.clamp(0, newLocalAmountText.length),
              extentOffset: currentSelection.extentOffset.clamp(0, newLocalAmountText.length),
            );
          } catch (e) {
            // Fallback: mover el cursor al final si hay un error
            _localAmountController.selection = TextSelection.fromPosition(
              TextPosition(offset: _localAmountController.text.length),
            );
          }
        }

        return Column(
          children: [
            // Monto base (USD, EUR, etc..)
            ConvertTextFormField(
              controller: _baseAmountController,
              focusNode: _baseFocusNode, // Asignar el FocusNode
              monitor: monitor,
              onChanged: (monitor, amount) {
                // Aquí, el onChanged es para actualizar el CUBIT.
                // El control del TextEditingController se hace en el BlocBuilder.
                context.read<ConvertCubit>().toLocalCurrency(monitor, amount);
              },
              resetValues: context.read<ConvertCubit>().resetAmount,
            ),

            const SizedBox(height: 20),

            // Monto local (VES)
            ConvertTextFormField(
              controller: _localAmountController,
              focusNode: _localFocusNode, // Asignar el FocusNode
              monitor: monitor,
              symbol: convertState.localCurrency.symbol,
              onChanged: (monitor, amount) {
                context.read<ConvertCubit>().toBaseCurrency(monitor, amount);
              },
              hintText: convertState.localCurrency.pluralName,
              resetValues: context.read<ConvertCubit>().resetAmount,
            ),
          ],
        );
      },
    );
  }
}
