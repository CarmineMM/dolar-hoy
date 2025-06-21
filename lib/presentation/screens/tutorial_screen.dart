import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  static const String routeName = 'tutorial';
  static const String routePath = '/tutorial';

  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _TutorialStep(
          icon: Icons.list_alt,
          title: '1. Revisa las Cotizaciones',
          description:
              'En la pantalla principal, encontrarás una lista con las diferentes tasas de cambio del dólar. Cada una muestra su valor en bolívares y la fecha de su última actualización.',
        ),
        const SizedBox(height: 20),
        _TutorialStep(
          icon: Icons.touch_app,
          title: '2. Selecciona tu Tasa de Referencia',
          description:
              'Para usar la calculadora, primero elige una tasa. Puedes hacerlo de dos formas:\n\n• Tocando directamente una cotización en la lista.\n• Usando el menú desplegable que se encuentra en la tarjeta de la calculadora.',
        ),
        const SizedBox(height: 20),
        _TutorialStep(
          icon: Icons.calculate,
          title: '3. Usa la Calculadora Inteligente',
          description:
              'Una vez seleccionada la tasa, la calculadora se activa. Tiene dos campos:\n\n• Arriba: para la moneda extranjera (ej. USD).\n• Abajo: para la moneda local (VES).\n\nSimplemente escribe un monto en cualquiera de los dos campos y el otro se convertirá automáticamente.',
        ),
        const SizedBox(height: 20),
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '¡Y listo! Así de fácil es mantenerse al día con el valor del dólar.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TutorialStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TutorialStep({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colorScheme.primary, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
