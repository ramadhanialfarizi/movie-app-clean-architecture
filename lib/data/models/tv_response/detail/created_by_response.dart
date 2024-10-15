import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'created_by_response.g.dart';

@JsonSerializable()
class CreatedByResponse extends Equatable {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "credit_id")
  String? creditId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "profile_path")
  String? profilePath;

  CreatedByResponse({
    this.id,
    this.creditId,
    this.name,
    this.originalName,
    this.gender,
    this.profilePath,
  });

  factory CreatedByResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatedByResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        creditId,
        name,
        originalName,
        gender,
        profilePath,
      ];
}
