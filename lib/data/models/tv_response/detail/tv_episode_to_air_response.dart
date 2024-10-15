import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_episode_to_air_response.g.dart';

@JsonSerializable()
class TvEpisodeToAirResponse extends Equatable {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "vote_average")
  int? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_number")
  int? episodeNumber;
  @JsonKey(name: "episode_type")
  String? episodeType;
  @JsonKey(name: "production_code")
  String? productionCode;
  @JsonKey(name: "runtime")
  int? runtime;
  @JsonKey(name: "season_number")
  int? seasonNumber;
  @JsonKey(name: "show_id")
  int? showId;
  @JsonKey(name: "still_path")
  dynamic stillPath;

  TvEpisodeToAirResponse({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory TvEpisodeToAirResponse.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeToAirResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeToAirResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        overview,
        voteAverage,
        voteCount,
        airDate,
        episodeNumber,
        episodeType,
        productionCode,
        runtime,
        seasonNumber,
        showId,
        stillPath,
      ];
}
