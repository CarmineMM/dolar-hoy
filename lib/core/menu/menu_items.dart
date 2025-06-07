import 'package:dolar_hoy/presentation/screens/about_screen.dart';
import 'package:dolar_hoy/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  final IconData icon;

  const MenuItem({required this.title, required this.route, required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Inicio', route: HomeScreen.routeName, icon: Icons.home),
  MenuItem(title: 'Acerca de', route: AboutScreen.routeName, icon: Icons.info),
];
