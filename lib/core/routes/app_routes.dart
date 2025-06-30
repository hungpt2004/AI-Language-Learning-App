import 'package:flutter/material.dart';
import '../../features/authentication/presentation/view/authen-gate/authentication_page.dart';
import '../../features/authentication/presentation/view/signin-screen/signin_page.dart';
import '../../screens/home_screen.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        auth: (context) => const AuthenticationGate(),
        login: (context) => const SignInPage(),
        home: (context) => const HomeScreen(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return _createRoute(const AuthenticationGate(), SlideTransitionType.slideUp);
      case login:
        return _createRoute(const SignInPage(), SlideTransitionType.slideRight);
      case home:
        return _createRoute(const HomeScreen(), SlideTransitionType.fade);
      default:
        return _createRoute(
          const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
          SlideTransitionType.fade,
        );
    }
  }

  static PageRouteBuilder _createRoute(Widget page, SlideTransitionType transitionType) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _buildTransition(animation, secondaryAnimation, child, transitionType);
      },
    );
  }

  static Widget _buildTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    SlideTransitionType transitionType,
  ) {
    switch (transitionType) {

      // Hiệu ứng trượt qua bên phải
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

      // Hiệu ứng trượt lên
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

      // Hiệu ứng trượt xuống
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

      // Hiệu ứng trượt sang trái
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

      // Hiệu ứng làm mờ
      case SlideTransitionType.fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );

      // Hiệu ứng phóng to
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

      // Hiệu ứng xoay tròn
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

enum SlideTransitionType {
  slideRight,
  slideLeft,
  slideUp,
  slideDown,
  fade,
  scale,
  rotation,
}
