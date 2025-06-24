import 'package:carenet_attendance_app/features/authentication/domain/repositories/authLocalDataRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authlocaldataimpl implements Authlocaldatarepository {

  final SharedPreferences prefs;

  Authlocaldataimpl(this.prefs);

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