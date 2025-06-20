import 'package:carenet_attendance_app/features/authentication/data/datasources/authenticationRemoteDataSource.dart';
import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';
import 'package:dio/dio.dart';

class Authenticationremotedatasourceimpl implements Authenticationremotedatasource {

  final Dio dio;

  Authenticationremotedatasourceimpl(this.dio);

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
  
  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 500));
      return User(id: '3', fullname: 'loginuser', email: 'hugn', password: '123');
    } catch (error) {
      print(error.toString());
    }
  }

  

}