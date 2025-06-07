import 'package:dolar_hoy/core/constants/breakpoints.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:dolar_hoy/presentation/widgets/calculator/calculator_card_monitor.dart';
import 'package:dolar_hoy/presentation/widgets/list_details_rates_monitor.dart';
import 'package:dolar_hoy/presentation/widgets/share/branding_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  static const String routePath = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final settingBloc = context.read<SettingBloc>().state;

    context.read<MonitorBloc>().add(
      MonitorGetData(currency: settingBloc.currency.apiKey, page: settingBloc.page.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BlocConsumer<MonitorBloc, MonitorState>(
      listener: (context, state) {
        if (state is MonitorLoaded) {
          context.read<SettingBloc>().add(SelectDefaultMonitor(monitors: state.monitors));
        }
      },
      builder: (context, state) {
        // Carga de los monitores
        if (state is MonitorLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // Error en la carga de monitores
        if (state is MonitorError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(state.message),
            ),
          );
        }

        // Listado de monitores
        if (state is MonitorLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  screenSize.width > Breakpoints.mobile
                      // Pantalla grande
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: CalculatorCardMonitor()),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 2,
                              child: ListDetailsRatesMonitor(monitors: state.monitors),
                            ),
                          ],
                        )
                      // Pantalla pequeña (Dispositivos)
                      : Column(
                          children: [
                            const BrandingApp(),
                            const CalculatorCardMonitor(),
                            const SizedBox(height: 20),
                            ListDetailsRatesMonitor(monitors: state.monitors),
                          ],
                        ),
                ],
              ),
            ),
          );
        }

        return const Center(child: Text('No hay data disponible para mostrar'));
      },
    );
  }
}
