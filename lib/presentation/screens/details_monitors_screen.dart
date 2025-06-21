import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsMonitorsScreen extends StatelessWidget {
  static const String routeName = 'details_monitors';
  static const String routePath = '/details-monitors';

  const DetailsMonitorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        final textTheme = Theme.of(context).textTheme;
        final settingBloc = context.watch<SettingBloc>().state;
        final colorScheme = Theme.of(context).colorScheme;

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
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título de la página actual
                  Text(
                    settingBloc.page.description,
                    style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Texto de lista de monitores
                  Text(
                    'Lista de monitores (${state.monitors.length} disponibles)',
                    style: textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),

                  // Lista de monitores
                  Expanded(
                    child: Card(
                      child: ListView.builder(
                        itemCount: state.monitors.length,
                        itemBuilder: (context, index) {
                          final monitor = state.monitors[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Text(
                                monitor.currency.symbol,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(monitor.title, style: textTheme.titleMedium),
                            subtitle: monitor.lastUpdate != null
                                ? Text(
                                    'Última actualización: ${monitor.lastUpdateString}',
                                    style: textTheme.bodySmall,
                                  )
                                : null,
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Bs. ${monitor.price.toStringAsFixed(2)}',
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),
                                if (monitor.changePercentage != 0)
                                  Text(
                                    '${monitor.changePercentage > 0 ? '+' : ''}${monitor.changePercentage.toStringAsFixed(2)}%',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: monitor.changePercentage > 0
                                          ? Colors.green[600]
                                          : Colors.red[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
