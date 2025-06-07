import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ConvertTextFormField extends StatefulWidget {
  final Monitor monitor;
  final void Function(Monitor monitor, double amount) onChanged;
  final TextEditingController? controller;
  final String? symbol;
  final String? hintText;
  final void Function(Monitor monitor)? resetValues;
  final FocusNode? focusNode;

  const ConvertTextFormField({
    super.key,
    required this.monitor,
    required this.onChanged,
    this.controller,
    this.symbol,
    this.hintText,
    this.resetValues,
    this.focusNode,
  });

  @override
  State<ConvertTextFormField> createState() => _ConvertTextFormFieldState();
}

class _ConvertTextFormFieldState extends State<ConvertTextFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      hintText: widget.hintText ?? widget.monitor.currency.pluralName,
      keyboardType: TextInputType.number,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Align(
          widthFactor: 1,
          heightFactor: 1,
          child: Text(
            widget.symbol ?? widget.monitor.currency.symbol,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          // resetValues?.call(monitor);
          return;
        }

        try {
          widget.onChanged(widget.monitor, double.parse(value));
        } catch (e) {
          widget.onChanged(widget.monitor, 0);
        }
      },
    );
  }
}
