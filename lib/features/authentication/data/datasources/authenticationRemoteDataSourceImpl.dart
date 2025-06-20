import 'package:carenet_attendance_app/features/authentication/data/datasources/authenticationRemoteDataSource.dart';
import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';

class Authenticationremotedatasourceimpl implements Authenticationremotedatasource {

  @override
  Future<List<User>> findAllUsers() async {
    try {
      await Future.delayed(Duration(seconds: 500));
      return [
        User(id: '1', fullname: 'Hung', email: 'Hung@gmail.com', password: '1234'),
        User(id: '1', fullname: 'Hung', email: 'Hung@gmail.com', password: '1234')
      ];
    } catch (error) {
      return [];
    }
  }

}