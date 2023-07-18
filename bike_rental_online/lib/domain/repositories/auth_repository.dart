abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<void> logout();
}
