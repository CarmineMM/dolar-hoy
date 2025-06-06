import 'package:flutter/material.dart';

class BrandingApp extends StatelessWidget {
  final double height;

  const BrandingApp({super.key, this.height = 120});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/icon/launcher_icon.png', height: height),
            // Text(Environment.appName, style: textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
