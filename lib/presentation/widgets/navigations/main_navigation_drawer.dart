import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/core/constants/theme_colors.dart';
import 'package:dolar_hoy/core/menu/menu_items.dart';
import 'package:dolar_hoy/presentation/widgets/share/branding_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: -1,
      onDestinationSelected: (value) {
        Navigator.of(context).pop();

        final menuItem = appMenuItems[value];

        context.pushNamed(menuItem.route);
      },
      children: [
        Center(
          child: Column(
            children: [
              const BrandingApp(height: 90),
              const SizedBox(height: 10),
              Text(Environment.appName, style: textTheme.titleMedium),
            ],
          ),
        ),

        const SizedBox(height: 20),

        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title)),
        ),
      ],
    );
  }
}
