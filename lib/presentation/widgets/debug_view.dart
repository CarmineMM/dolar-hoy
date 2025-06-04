import 'package:dolar_hoy/domain/debug/stacktrace.dart';
import 'package:flutter/material.dart';

class DebugView extends StatelessWidget {
  const DebugView({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = StackTrace();

    return Scaffold(
      appBar: AppBar(title: Text('Registro de la aplicación')),
      body: ListView.builder(
        itemCount: logger.messages.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(logger.messages[index]));
        },
      ),
    );
  }
}
