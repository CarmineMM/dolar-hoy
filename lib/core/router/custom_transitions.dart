import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitions {
  static const Duration _duration = Duration(milliseconds: 120);
  static const Curve _curve = Curves.easeOut;

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required bool isLargeScreen,
  }) {
    if (!isLargeScreen) {
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    }

    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: _duration,
      reverseTransitionDuration: _duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // For the exiting page (current page)
        final scaleTween = Tween<double>(begin: 1.0, end: 0.95);
        final opacityTween = Tween<double>(begin: 1.0, end: 0.8);

        // For the entering page (new page)
        final offsetTween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);

        final curvedAnimation = CurvedAnimation(parent: animation, curve: _curve);

        // This stack handles both the zooming out of the old page and sliding in of the new page
        return Stack(
          children: [
            // Zoom out effect for the current page
            if (animation.status != AnimationStatus.dismissed)
              ScaleTransition(
                scale: scaleTween.animate(curvedAnimation),
                child: FadeTransition(opacity: opacityTween.animate(curvedAnimation), child: child),
              ),
            // Slide in effect for the new page
            SlideTransition(
              position: offsetTween.animate(curvedAnimation),
              child: FadeTransition(opacity: animation, child: child),
            ),
          ],
        );
      },
    );
  }
}
