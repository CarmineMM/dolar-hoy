import 'package:flutter/material.dart';

class ShareCalculator extends StatelessWidget {
  const ShareCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share),
      label: const Text('Compartir'),
      onPressed: () {},
    );
  }
}
