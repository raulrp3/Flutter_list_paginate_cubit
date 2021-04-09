// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CharacterPageRepo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPageRepo _$CharacterPageRepoFromJson(Map<String, dynamic> json) {
  return CharacterPageRepo(
    info: json['info'],
    results: (json['results'] as List<dynamic>)
        .map((e) => CharacterRepo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharacterPageRepoToJson(CharacterPageRepo instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
