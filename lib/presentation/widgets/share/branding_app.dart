import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:flutter/material.dart';

class BrandingApp extends StatelessWidget {
  const BrandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 150,
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/icon/launcher_icon.png', height: 120),
            Text(Environment.appName, style: textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
