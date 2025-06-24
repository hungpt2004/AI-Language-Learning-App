import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  // Navigate with replacement (không back được)
  static Future<void> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  // Navigate normal (có thể back)
  static Future<void> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  // Navigate and clear all previous routes
  static Future<void> pushNamedAndClearStack(String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  // Pop current route
  static void pop([Object? result]) {
    return Navigator.of(context).pop(result);
  }

  // Check if can pop
  static bool canPop() {
    return Navigator.of(context).canPop();
  }

  // Custom navigation with specific transition
  static Future<void> navigateWithTransition({
    required Widget page,
    SlideTransitionType transitionType = SlideTransitionType.slideRight,
    Duration duration = const Duration(milliseconds: 300),
    bool replacement = false,
  }) {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(animation, secondaryAnimation, child, transitionType);
      },
    );

    if (replacement) {
      return Navigator.of(context).pushReplacement(route);
    } else {
      return Navigator.of(context).push(route);
    }
  }

  // Specific navigation methods for common flows
  static Future<void> toLogin() {
    return pushReplacementNamed(AppRoutes.login);
  }

  static Future<void> toHome() {
    return pushNamedAndClearStack(AppRoutes.home);
  }

  static Future<void> toAuth() {
    return pushReplacementNamed(AppRoutes.auth);
  }

  static Widget _buildTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    SlideTransitionType transitionType,
  ) {
    switch (transitionType) {
      case SlideTransitionType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );

      case SlideTransitionType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );

      case SlideTransitionType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );

      case SlideTransitionType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );

      case SlideTransitionType.fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );

      case SlideTransitionType.scale:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );

      case SlideTransitionType.rotation:
        return RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
    }
  }
}
