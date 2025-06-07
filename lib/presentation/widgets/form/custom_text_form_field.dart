import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colors.primary),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        hintText: hintText,
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(width: 2, color: colors.primary)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(width: 2, color: colors.error)),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
