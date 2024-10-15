import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_response.g.dart';

@JsonSerializable()
class SeasonResponse extends Equatable {
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_count")
  int? episodeCount;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "season_number")
  int? seasonNumber;
  @JsonKey(name: "vote_average")
  int? voteAverage;

  SeasonResponse({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory SeasonResponse.fromJson(Map<String, dynamic> json) =>
      _$SeasonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}
