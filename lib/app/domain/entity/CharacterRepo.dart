import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CharacterRepo.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class CharacterRepo extends Equatable {
  String name;
  String image;

  CharacterRepo({required this.name, required this.image});

  static CharacterRepo fromJson(Map<String, dynamic> json) =>
      _$CharacterRepoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterRepoToJson(this);

  @override
  List<Object?> get props => [name, image];
}
