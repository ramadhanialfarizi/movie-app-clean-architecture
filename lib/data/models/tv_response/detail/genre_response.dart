import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse extends Equatable {
  int? id;
  String? name;

  GenreResponse({
    this.id,
    this.name,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
