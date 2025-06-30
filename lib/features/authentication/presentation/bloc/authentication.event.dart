import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent implements Equatable {}
class SignInWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  SignInWithEmailAndPassword({
    required this.email,
    required this.password
  });
  
  // Dùng để so sánh giá trị giữa state cũ và state mới -> có thay đổi hay không ?
  @override
  List<Object?> get props => [email, password];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

class SignUpWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  final String dateOfBirth;
  SignUpWithEmailAndPassword({
    required this.email,
    required this.password,
    required this.dateOfBirth
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class ForgotPassword extends AuthenticationEvent {
  final String email;
  ForgotPassword({required this.email});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class ResetPassword extends AuthenticationEvent {
  final String newPassowrd;
  ResetPassword({required this.newPassowrd});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}