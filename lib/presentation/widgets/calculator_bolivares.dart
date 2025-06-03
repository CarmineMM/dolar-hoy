import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/settings/settings_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CalculatorBolivares extends StatefulWidget {
  const CalculatorBolivares({super.key});

  @override
  State<CalculatorBolivares> createState() => _CalculatorBolivaresState();
}

class _CalculatorBolivaresState extends State<CalculatorBolivares> {
  @override
  Widget build(BuildContext context) {
    final monitor = context.watch<SettingsCubit>().state.monitor;
    final convert = context.watch<ConvertCubit>().state;

    print(convert);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: monitor.currency.pluralName,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Text(monitor.currency.symbol, style: const TextStyle(fontSize: 16, height: 1.5)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(hintText: convert.localCurrency.pluralName),
          ],
        ),
      ),
    );
  }
}
