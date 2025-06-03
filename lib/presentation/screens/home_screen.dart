import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/settings/settings_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/calculator_bolivares.dart';
import 'package:dolar_hoy/presentation/widgets/list_details_rates_monitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  static const String routePath = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MonitorBloc>().add(MonitorGetData(currency: 'dollar'));

    context.read<SettingsCubit>().selectMonitorFromMonitorsList(context.read<MonitorBloc>().state.monitors);
  }

  @override
  Widget build(BuildContext context) {
    final monitors = context.read<MonitorBloc>().state.monitors;

    return Scaffold(
      appBar: AppBar(title: Text(Environment.appName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              ListDetailsRatesMonitor(monitors: monitors),
              const SizedBox(height: 20),
              CalculatorBolivares(),
            ],
          ),
        ),
      ),
    );
  }
}
