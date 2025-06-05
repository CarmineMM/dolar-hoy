import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/page/page_cubit.dart';
import 'package:dolar_hoy/presentation/widgets/share/network_image_with_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPageMonitor extends StatelessWidget {
  const SelectPageMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = context.watch<PageCubit>().state;
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: () => _showDialog(context, pageState),
      child: Row(
        children: [
          NetworkImageWithFallback(pageState.page.imageUrl, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(pageState.page.description, style: TextStyle(color: colorScheme.onPrimary)),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, PageState pageState) async {
    final colorScheme = Theme.of(context).colorScheme;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona una página'),
          actions: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.secondary,
                // minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, color: colorScheme.onPrimary),
              label: const Text('Cancelar'),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...PagesConvertion.values.map((page) {
                return RadioListTile(
                  value: page,
                  groupValue: pageState.page,
                  onChanged: (value) {
                    context.read<PageCubit>().setPage(value!);
                    context.read<MonitorBloc>().add(
                      MonitorGetData(currency: pageState.currency.apiKey, page: value.value),
                    );
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
