import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubit/app/domain/entity/CharacterPageRepo.dart';
import 'package:rick_morty_cubit/app/domain/entity/CharacterRepo.dart';
import 'package:rick_morty_cubit/app/domain/repository/CharacterRepository.dart';

part 'CharactersState.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._characterRepository) : super(CharactersState.initial());

  final CharacterRepository _characterRepository;

  Future<void> loadCharacters({int page = 1}) async {
    try {
      emit(CharactersState.loading());
      final CharacterPageRepo data =
          await _characterRepository.getCharacters(page);
      final List<CharacterRepo> characters = data.results;

      emit(CharactersState.success(characters));
    } on Exception catch (error) {
      emit(CharactersState.error('$error'));
    }
  }
}
