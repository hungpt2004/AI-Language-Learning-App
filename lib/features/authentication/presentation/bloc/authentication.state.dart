import 'package:carenet_attendance_app/features/authentication/data/entities/user.entity.dart';

abstract class AuthenticationState {}

class AuthenSuccess extends AuthenticationState {
  User? user;
  String? message;
  AuthenSuccess(this.user, this.message);
}

class AuthenInitial extends AuthenticationState {}

class AuthenLoading extends AuthenticationState {}

class AuthenError extends AuthenticationState {
  String? error;
  AuthenError(this.error);
}

