import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:dolar_hoy/presentation/widgets/form/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectMonitorDropdown extends StatelessWidget {
  const SelectMonitorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final monitor = context.watch<SettingBloc>().state.monitor;
    final monitorState = context.watch<MonitorBloc>().state as MonitorLoaded;
    final convertCubit = context.read<ConvertCubit>();

    if (monitorState.monitors.isEmpty ||
        monitorState.monitors.length < 2 ||
        monitor.name == Monitor.empty().name) {
      return const SizedBox.shrink();
    }

    return CustomDropdownField<Monitor>(
      value: monitor,
      label: 'Monitor de tasas',
      items: monitorState.monitors
          .map((monitor) => DropdownMenuItem(value: monitor, child: Text(monitor.title)))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          context.read<SettingBloc>().add(SettingSetMonitor(monitor: value));
          convertCubit.toLocalCurrency(value, convertCubit.state.baseAmount);
        }
      },
    );
  }
}
