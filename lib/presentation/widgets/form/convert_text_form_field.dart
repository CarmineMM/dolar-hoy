import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ConvertTextFormField extends StatelessWidget {
  final Monitor monitor;
  final void Function(Monitor monitor, double amount) onChanged;
  final TextEditingController? controller;
  final String? symbol;
  final String? hintText;

  const ConvertTextFormField({
    super.key,
    required this.monitor,
    required this.onChanged,
    this.controller,
    this.symbol,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText ?? monitor.currency.pluralName,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Align(
          widthFactor: 1,
          heightFactor: 1,
          child: Text(symbol ?? monitor.currency.symbol, style: const TextStyle(fontSize: 16, height: 1.5)),
        ),
      ),
      onChanged: (value) {
        if (value.isEmpty) return;
        onChanged(monitor, double.parse(value));
      },
    );
  }
}
