import 'package:carenet_attendance_app/features/authentication/data/repositories/authenticationRepositoryImpl.dart';
import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';

class AuthenticationService {

  final Authenticationrepositoryimpl authenticationRepo;

  AuthenticationService(this.authenticationRepo);

  Future<List<User>> findAllUsers() async {
    return authenticationRepo.findAllUsers();
  }

}