import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'created_by_response.g.dart';

@JsonSerializable()
class CreatedByResponse extends Equatable {
  int? id;
  String? creditId;
  String? name;
  String? originalName;
  int? gender;
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
