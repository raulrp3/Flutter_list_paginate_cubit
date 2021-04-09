import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty_cubit/app/domain/entity/CharacterRepo.dart';

part 'CharacterPageRepo.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class CharacterPageRepo extends Equatable {
  late final dynamic info;
  late final List<CharacterRepo> results;

  CharacterPageRepo({required this.info, required this.results});

  static CharacterPageRepo fromJson(Map<String, dynamic> json) =>
      _$CharacterPageRepoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPageRepoToJson(this);

  @override
  List<Object> get props => [info, results];
}
