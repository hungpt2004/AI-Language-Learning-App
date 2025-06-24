import 'package:carenet_attendance_app/features/authentication/data/datasources/authLocalDataImpl.dart';
import 'package:carenet_attendance_app/features/authentication/data/datasources/authenticationRemoteDataSourceImpl.dart';
import 'package:carenet_attendance_app/features/authentication/domain/repositories/authenticationRepository.dart';
import 'package:carenet_attendance_app/features/authentication/domain/entities/user.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticationrepositoryimpl implements Authenticationrepository {

  final Authenticationremotedatasourceimpl authenticationRemote;
  late final SharedPreferences prefs;
  late final Authlocaldataimpl authenticationLocal;

  Authenticationrepositoryimpl(this.authenticationRemote);

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    authenticationLocal = Authlocaldataimpl(prefs);
  }

  @override
  Future<List<User>> findAllUsers() {
    return authenticationRemote.findAllUsers();
  }
  
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await authenticationRemote.signInWithEmailAndPassword(email, password);
    await authenticationLocal.saveToken('1234566');
  }

} 