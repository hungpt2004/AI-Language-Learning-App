abstract class Authlocaldatarepository {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> removeToken();
}