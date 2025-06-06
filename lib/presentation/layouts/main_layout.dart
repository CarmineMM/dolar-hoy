import 'package:dolar_hoy/presentation/widgets/navigations/main_navigation_drawer.dart';
import 'package:dolar_hoy/presentation/widgets/select_page_monitor.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget? child;

  const MainLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: AppBar(actions: [const SelectPageMonitor()]),
      drawer: const MainNavigationDrawer(),
    );
  }
}
