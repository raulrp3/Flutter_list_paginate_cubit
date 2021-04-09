import 'package:rick_morty_cubit/app/domain/repository/AuthenticationRepository.dart';

class ApiAuthenticationRepository implements AuthenticationRepository {
  @override
  Future<String> login(String username, String password) {
    return Future<String>.delayed(Duration(seconds: 1), () {
      if (username == 'admin' && password == 'admin') {
        return 'token';
      }
      throw Exception('Credenciales no válidas.');
    });
  }
}
