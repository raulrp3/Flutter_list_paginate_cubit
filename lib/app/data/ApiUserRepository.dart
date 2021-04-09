import 'package:dio/dio.dart';
import 'package:rick_morty_cubit/app/domain/repository/UserRepository.dart';

class ApiUserRepository implements UserRepository {
  @override
  Future<String?> getUser() async {
    return 'Raúl';
  }
}
