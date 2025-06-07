import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownSelectCurrency extends StatelessWidget {
  const DropdownSelectCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBloc = context.read<SettingBloc>();

    return CustomDropdownField<CurrencyApi>(
      value: settingBloc.state.currency,
      label: 'Moneda',
      items: CurrencyApi.values
          .map((currency) => DropdownMenuItem(value: currency, child: Text(currency.title)))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          SettingSetCurrency(currency: value);
        }
      },
    );
  }
}
