import 'package:carenet_attendance_app/features/authentication/domain/repositories/authLocalDataRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthlocaldataImpl implements Authlocaldatarepository {

  final SharedPreferences prefs;

  AuthlocaldataImpl(this.prefs);

  @override
  Future<String?> getToken() async {
    return prefs.getString('token');
  }

  @override
  Future<void> removeToken() async {
    await prefs.remove('token');
  }

  @override
  Future<void> saveToken(String token) async {
    await prefs.setString('token', token);
  }
  
}