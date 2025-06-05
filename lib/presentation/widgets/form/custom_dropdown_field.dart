import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final String? label;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colors.primary),
    );

    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, isDense: true, border: border),
      items: items,
    );
  }
}
