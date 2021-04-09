abstract class AuthenticationRepository {
  Future<String> login(String username, String password);
}
