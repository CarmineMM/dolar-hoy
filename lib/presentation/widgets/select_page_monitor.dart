import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:dolar_hoy/presentation/widgets/share/network_image_with_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPageMonitor extends StatelessWidget {
  const SelectPageMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBloc = context.watch<SettingBloc>().state;
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: () => _showDialog(context, settingBloc),
      child: Row(
        children: [
          NetworkImageWithFallback(settingBloc.page.imageUrl, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(settingBloc.page.description, style: TextStyle(color: colorScheme.onPrimary)),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, SettingState settingBloc) async {
    final colorScheme = Theme.of(context).colorScheme;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text('Selecciona una página'),
          ),
          actions: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.secondary,
                // minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              label: const Text('Cerrar'),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...PagesConvertion.values.map((page) {
                return RadioListTile(
                  value: page,
                  groupValue: settingBloc.page,
                  onChanged: (value) {
                    if (value == null) return;

                    context.read<MonitorBloc>().add(
                      MonitorGetData(currency: settingBloc.currency.apiKey, page: value.value),
                    );
                    context.read<SettingBloc>().add(SettingSetPage(page: value));
                    Navigator.pop(context);
                  },
                  title: Row(
                    children: [
                      // NetworkImageWithFallback(page.imageUrl, width: 20, height: 20),
                      // const SizedBox(width: 10),
                      Text(page.description),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
