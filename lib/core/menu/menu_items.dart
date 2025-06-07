import 'package:dolar_hoy/presentation/screens/details_monitors_screen.dart';
import 'package:dolar_hoy/presentation/screens/terms_screen.dart';
import 'package:dolar_hoy/presentation/screens/home_screen.dart';
import 'package:dolar_hoy/presentation/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  final IconData icon;

  const MenuItem({required this.title, required this.route, required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Inicio', route: HomeScreen.routeName, icon: Icons.home_outlined),
  MenuItem(
    title: 'Monitores',
    route: DetailsMonitorsScreen.routeName,
    icon: Icons.currency_exchange,
  ),
  MenuItem(title: 'Cómo usar', route: TutorialScreen.routeName, icon: Icons.info_outline),

  MenuItem(
    title: 'Términos y Condiciones',
    route: TermsScreen.routeName,
    icon: Icons.perm_device_info_outlined,
  ),
];
