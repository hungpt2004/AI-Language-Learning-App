import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../inject_container_di.dart';
import '../../../../../core/routes/app_navigator.dart';

class AuthenticationGate extends StatefulWidget {
  const AuthenticationGate({super.key});

  @override
  State<AuthenticationGate> createState() => _AuthenticationGateState();
}

class _AuthenticationGateState extends State<AuthenticationGate> {
  bool _isLoading = true;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthenticationStatus();
  }

  Future<void> _checkAuthenticationStatus() async {
    try {
      final prefs = sl<SharedPreferences>();
      final token = prefs.getString('access_token');
      
      setState(() {
        _isAuthenticated = token != null && token.isNotEmpty;
        _isLoading = false;
      });

      // Điều hướng sau khi kiểm tra xong
      _navigateBasedOnAuth();
    } catch (e) {
      setState(() {
        _isAuthenticated = false;
        _isLoading = false;
      });
      _navigateBasedOnAuth();
    }
  }
  void _navigateBasedOnAuth() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isAuthenticated) {
        AppNavigator.toHome();
      } else {
        // Không có token -> vào trang Login
        AppNavigator.toLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Checking authentication...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    // Trường hợp fallback (không nên hiển thị)
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}