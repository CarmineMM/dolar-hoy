import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/infrastructure/datasources/monitor_py_dolarve_datasource.dart';
import 'package:dolar_hoy/infrastructure/repositories/monitor_repository_impl.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/widgets/list_details_rates_monitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static const String routePath = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Environment.appName)),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => MonitorBloc(repository: MonitorRepositoryImpl(MonitorPyDolarVeDatasource())),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(children: [ListDetailsRatesMonitor(monitors: [])]),
          ),
        ),
      ),
    );
  }
}
