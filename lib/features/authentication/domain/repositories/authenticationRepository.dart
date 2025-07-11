import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';

abstract class Authenticationrepository {
  Future<List<User>> findAllUsers();
  Future<void> signInWithEmailAndPassword(String email, String password); 
}