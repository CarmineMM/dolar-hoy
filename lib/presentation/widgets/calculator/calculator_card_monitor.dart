import 'package:dolar_hoy/presentation/widgets/action_buttons/share_calculator.dart';
import 'package:dolar_hoy/presentation/widgets/calculator/calculator_convert.dart';
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(flex: 1, child: DropdownSelectCurrency()),
                // SizedBox(width: 20),
                Expanded(flex: 1, child: SelectMonitorDropdown()),
              ],
            ),
            SizedBox(height: 20),
            CalculatorConvert(),
            SizedBox(height: 20),
            ShareCalculator(),
          ],
        ),
      ),
    );
  }
}
