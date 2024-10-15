import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_response.g.dart';

@JsonSerializable()
class SpokenLanguageResponse extends Equatable {
  @JsonKey(name: "english_name")
  String? englishName;
  @JsonKey(name: "iso_639_1")
  String? iso6391;
  @JsonKey(name: "name")
  String? name;

  SpokenLanguageResponse({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
