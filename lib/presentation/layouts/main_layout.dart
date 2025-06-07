import 'package:dolar_hoy/core/constants/breakpoints.dart';
import 'package:dolar_hoy/presentation/widgets/navigations/main_navigation_drawer.dart';
import 'package:dolar_hoy/presentation/widgets/navigations/select_page_monitor.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget? child;

  const MainLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: screenSize.width > Breakpoints.mobile
          ? Row(
              children: [
                const Expanded(flex: 1, child: MainNavigationDrawer()),
                child != null
                    ? Expanded(flex: 3, child: child!)
                    : const Center(child: Text('No hay data disponible para mostrar')),
              ],
            )
          : child,
      appBar: AppBar(actions: [const SelectPageMonitor()]),
      drawer: screenSize.width > Breakpoints.mobile ? null : const MainNavigationDrawer(),
    );
  }
}
