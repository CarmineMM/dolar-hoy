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
    final settingsCubit = context.watch<SettingsCubit>();

    print(settingsCubit.state.monitor);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomTextFormField(hintText: 'Hola'),
            const SizedBox(height: 20),
            CustomTextFormField(label: 'Hola'),
          ],
        ),
      ),
    );
  }
}
