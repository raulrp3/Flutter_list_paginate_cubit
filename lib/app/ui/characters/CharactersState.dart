part of 'CharactersCubit.dart';

enum CharactersStatus { initial, loading, success, error }

class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<CharacterRepo>? characters;
  final String? error;

  const CharactersState._(
      {this.status = CharactersStatus.initial, this.characters, this.error});

  const CharactersState.initial() : this._();
  const CharactersState.loading() : this._(status: CharactersStatus.loading);
  const CharactersState.success(List<CharacterRepo> characters)
      : this._(status: CharactersStatus.success, characters: characters);
  const CharactersState.error(String error)
      : this._(status: CharactersStatus.error, error: error);

  @override
  List<Object?> get props => [status];
}
