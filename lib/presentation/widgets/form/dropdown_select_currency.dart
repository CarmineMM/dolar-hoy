import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:dolar_hoy/presentation/bloc/page/page_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownSelectCurrency extends StatelessWidget {
  const DropdownSelectCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    final pageCubit = context.read<PageCubit>();

    return CustomDropdownField<CurrencyApi>(
      value: pageCubit.state.currency,
      label: 'Moneda',
      items: CurrencyApi.values
          .map((e) => DropdownMenuItem(value: e, child: Text(e.title)))
          .toList(),
      onChanged: (value) {
        pageCubit.changeCurrency(value!);
      },
    );
  }
}
