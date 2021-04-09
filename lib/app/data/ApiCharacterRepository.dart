import 'package:dio/dio.dart';
import 'package:rick_morty_cubit/app/domain/entity/CharacterPageRepo.dart';
import 'package:rick_morty_cubit/app/domain/repository/CharacterRepository.dart';

class ApiCharacterRepositoy implements CharacterRepository {
  ApiCharacterRepositoy(this._dio);
  final Dio _dio;

  @override
  Future<CharacterPageRepo> getCharacters(int page) async {
    final response = await _dio.get('/character/?page=$page');
    if (response.statusCode == 200) {
      CharacterPageRepo data = CharacterPageRepo.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error downloading characters');
    }
  }
}
