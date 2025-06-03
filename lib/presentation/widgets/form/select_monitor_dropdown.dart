import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectMonitorDropdown extends StatelessWidget {
  const SelectMonitorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final monitor = context.watch<SettingsCubit>().state.monitor;
    final monitorState = context.read<MonitorBloc>().state as MonitorLoaded;

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colors.primary),
    );

    return DropdownButtonFormField<Monitor>(
      isExpanded: true,
      value: monitor,
      onChanged: (value) {
        context.read<SettingsCubit>().changeMonitor(value!);
        context.read<ConvertCubit>().toLocalCurrency(value, 31);
      },
      decoration: InputDecoration(labelText: 'Monitor de tasas', isDense: true, border: border),
      items: monitorState.monitors
          .map((monitor) => DropdownMenuItem(value: monitor, child: Text(monitor.title)))
          .toList(),
    );
  }
}
