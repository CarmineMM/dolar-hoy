import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/core/extensions/screen_size.dart';
import 'package:dolar_hoy/presentation/layouts/main_layout.dart';
import 'package:dolar_hoy/presentation/screens/details_monitors_screen.dart';
import 'package:dolar_hoy/presentation/screens/terms_screen.dart';
import 'package:dolar_hoy/presentation/screens/home_screen.dart';
import 'package:dolar_hoy/presentation/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './custom_transitions.dart';

// Helper function to create routes with custom transitions
List<RouteBase> _buildRoutes() {
  return [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, state, child) => MainLayout(child: child),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <GoRoute>[
            _buildRoute(
              path: HomeScreen.routePath,
              name: HomeScreen.routeName,
              builder: (context, state) => const HomeScreen(),
            ),
            _buildRoute(
              path: DetailsMonitorsScreen.routePath,
              name: DetailsMonitorsScreen.routeName,
              builder: (context, state) => const DetailsMonitorsScreen(),
            ),
            _buildRoute(
              path: TutorialScreen.routePath,
              name: TutorialScreen.routeName,
              builder: (context, state) => const TutorialScreen(),
            ),
            _buildRoute(
              path: TermsScreen.routePath,
              name: TermsScreen.routeName,
              builder: (context, state) => const TermsScreen(),
            ),
          ],
        ),
      ],
    ),
  ];
}

// Helper function to create a route with custom transitions
GoRoute _buildRoute({
  required String path,
  required String name,
  required Widget Function(BuildContext, GoRouterState) builder,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (BuildContext context, GoRouterState state) {
      final child = builder(context, state);

      return CustomTransitions.buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: child,
        isLargeScreen: context.isTablet,
      );
    },
  );
}

final appRouter = GoRouter(
  debugLogDiagnostics: Environment.debug,
  initialLocation: HomeScreen.routePath,
  routes: _buildRoutes(),
);
