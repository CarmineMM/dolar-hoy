import 'package:dolar_hoy/core/constants/breakpoints.dart';
import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/core/menu/menu_items.dart';
import 'package:dolar_hoy/presentation/screens/details_monitors_screen.dart';
import 'package:dolar_hoy/presentation/screens/home_screen.dart';
import 'package:dolar_hoy/presentation/screens/terms_screen.dart';
import 'package:dolar_hoy/presentation/screens/tutorial_screen.dart';
import 'package:dolar_hoy/presentation/widgets/share/branding_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({super.key});

  /// Obtiene el índice del elemento del menú basado en la ruta actual
  int _getSelectedIndex(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    // Buscar la ruta actual en el listado de rutas del menú
    for (int i = 0; i < appMenuItems.length; i++) {
      final menuItem = appMenuItems[i];

      // Comparar con las rutas principales
      if (currentLocation == _getRoutePath(menuItem.route)) {
        return i;
      }
    }

    // Si no coincide con ninguna ruta del menú, retornar -1
    return -1;
  }

  /// Obtiene la ruta path basada en el nombre de la ruta
  String _getRoutePath(String routeName) {
    switch (routeName) {
      case HomeScreen.routeName:
        return HomeScreen.routePath;
      case DetailsMonitorsScreen.routeName:
        return DetailsMonitorsScreen.routePath;
      case TutorialScreen.routeName:
        return TutorialScreen.routePath;
      case TermsScreen.routeName:
        return TermsScreen.routePath;
      default:
        return HomeScreen.routePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final navigation = Navigator.of(context);

    return NavigationDrawer(
      selectedIndex: _getSelectedIndex(context),
      onDestinationSelected: (value) {
        if (screenSize.width < Breakpoints.mobile && navigation.canPop()) {
          navigation.pop();
        }

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
