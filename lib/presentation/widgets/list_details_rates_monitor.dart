import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListDetailsRatesMonitor extends StatefulWidget {
  final List<Monitor> monitors;

  const ListDetailsRatesMonitor({super.key, required this.monitors});

  @override
  State<ListDetailsRatesMonitor> createState() => _ListDetailsRatesMonitorState();
}

class _ListDetailsRatesMonitorState extends State<ListDetailsRatesMonitor> {
  @override
  void initState() {
    super.initState();
    context.read<MonitorBloc>().add(MonitorGetData(currency: 'dollar'));
  }

  @override
  Widget build(BuildContext context) {
    final monitors = context.read<MonitorBloc>().state.monitors;

    return Card(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: monitors.length,
          itemBuilder: (context, index) {
            final monitor = monitors[index];

            return ListTile(
              title: Text(monitor.title),
              trailing: Text('Bs. ${monitor.price}'),
              subtitle: monitor.lastUpdate != null
                  ? Text(DateFormat('dd/MM/yyyy hh:mm a').format(monitor.lastUpdate!.toLocal()))
                  : null,
            );
          },
        ),
      ),
    );
  }
}
