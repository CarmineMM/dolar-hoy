import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/settings/settings_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/calculator_card_monitor.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Environment.appName)),
      body: BlocConsumer<MonitorBloc, MonitorState>(
        listener: (context, state) {
          if (state is MonitorLoaded) {
            final readSetting = context.read<SettingsCubit>();

            readSetting.selectMonitorFromMonitorsList(state.monitors);

            // context.read<ConvertCubit>().toLocalCurrency(readSetting.state.monitor, 1);
          }
        },
        builder: (context, state) {
          // Carga de los monitores
          if (state is MonitorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          // Error en la carga de monitores
          if (state is MonitorError) {
            return Center(child: Text(state.message));
          }

          // Listado de monitores
          if (state is MonitorLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    ListDetailsRatesMonitor(monitors: state.monitors),
                    const SizedBox(height: 20),
                    CalculatorCardMonitor(),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text('No hay data disponible para mostrar'));
        },
      ),
    );
  }
}
