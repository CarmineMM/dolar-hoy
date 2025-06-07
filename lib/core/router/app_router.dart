import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/presentation/layouts/main_layout.dart';
import 'package:dolar_hoy/presentation/screens/details_monitors_screen.dart';
import 'package:dolar_hoy/presentation/screens/terms_screen.dart';
import 'package:dolar_hoy/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: Environment.debug,
  initialLocation: HomeScreen.routePath,
  routes: [
    ShellRoute(
      builder: (BuildContext context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: HomeScreen.routePath,
          name: HomeScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        ),
        GoRoute(
          path: DetailsMonitorsScreen.routePath,
          name: DetailsMonitorsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const DetailsMonitorsScreen(),
        ),
        GoRoute(
          path: TermsScreen.routePath,
          name: TermsScreen.routeName,
          builder: (BuildContext context, GoRouterState state) => const TermsScreen(),
        ),
      ],
    ),
  ],
);
