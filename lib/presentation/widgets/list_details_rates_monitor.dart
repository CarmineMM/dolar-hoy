import 'package:dolar_hoy/core/constants/breakpoints.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListDetailsRatesMonitor extends StatelessWidget {
  final List<Monitor> monitors;

  const ListDetailsRatesMonitor({super.key, required this.monitors});

  double _calcHeightScreen(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return monitors.length >= 5
        ? (screenSize.width > Breakpoints.mobile ? screenSize.height * 0.75 : 290)
        : monitors.length * 75;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final convertCubic = context.read<ConvertCubit>();

    return Card(
      child: SizedBox(
        height: _calcHeightScreen(context),
        child: ListView.builder(
          physics: monitors.length <= 3 ? const NeverScrollableScrollPhysics() : null,
          itemCount: monitors.length,
          itemBuilder: (context, index) {
            final monitor = monitors[index];

            return GestureDetector(
              onTap: () {
                context.read<SettingBloc>().add(SettingSetMonitor(monitor: monitor));
                convertCubic.toLocalCurrency(monitor, convertCubic.state.baseAmount);
              },
              child: ListTile(
                title: Text(monitor.title),
                trailing: Text('Bs. ${monitor.price}', style: textTheme.bodyMedium),
                subtitle: monitor.lastUpdate != null
                    ? Text(monitor.lastUpdateString, style: textTheme.bodySmall)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
