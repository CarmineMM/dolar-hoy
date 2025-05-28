import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget? child;

  const MainLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
