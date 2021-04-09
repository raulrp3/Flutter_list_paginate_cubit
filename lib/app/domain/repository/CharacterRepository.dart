import 'package:rick_morty_cubit/app/domain/entity/CharacterPageRepo.dart';

abstract class CharacterRepository {
  Future<CharacterPageRepo> getCharacters(int page);
}
