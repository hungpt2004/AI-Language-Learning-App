import 'package:carenet_attendance_app/features/authentication/data/datasources/authenticationRemoteDataSourceImpl.dart';
import 'package:carenet_attendance_app/features/authentication/domain/repositories/authenticationRepository.dart';
import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';

class Authenticationrepositoryimpl implements Authenticationrepository {

  final Authenticationremotedatasourceimpl authenticationRemote;

  // Vì sao sử dụng constructor - var mà không sử dụng final
  Authenticationrepositoryimpl(this.authenticationRemote);

  @override
  Future<List<User>> findAllUsers() {
    return authenticationRemote.findAllUsers();
  }

} 