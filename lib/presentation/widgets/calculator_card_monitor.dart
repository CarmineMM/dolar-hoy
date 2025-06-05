import 'package:dolar_hoy/presentation/widgets/calculator_convert.dart';
import 'package:dolar_hoy/presentation/widgets/form/select_monitor_dropdown.dart';
import 'package:flutter/material.dart';

class CalculatorCardMonitor extends StatelessWidget {
  const CalculatorCardMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [SelectMonitorDropdown(), SizedBox(height: 20), CalculatorConvert()],
        ),
      ),
    );
  }
}
