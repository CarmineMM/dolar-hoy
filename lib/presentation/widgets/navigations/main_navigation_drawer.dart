import 'package:flutter/material.dart';

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: -1,
      onDestinationSelected: (value) {
        print(value);
      },
      children: [],
    );
  }
}
