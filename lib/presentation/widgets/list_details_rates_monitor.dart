import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:flutter/material.dart';

class ListDetailsRatesMonitor extends StatelessWidget {
  final List<Monitor> monitors;

  const ListDetailsRatesMonitor({super.key, required this.monitors});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Card(
      child: SizedBox(
        height: screenSize.width > 768 ? 500 : 300,
        child: ListView.builder(
          itemCount: monitors.length,
          itemBuilder: (context, index) {
            final monitor = monitors[index];

            return ListTile(
              title: Text(monitor.title),
              trailing: Text('Bs. ${monitor.price}'),
              subtitle: monitor.lastUpdate != null ? Text(monitor.lastUpdateString) : null,
            );
          },
        ),
      ),
    );
  }
}
