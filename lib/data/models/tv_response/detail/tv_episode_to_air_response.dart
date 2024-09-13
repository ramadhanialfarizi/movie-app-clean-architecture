import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_episode_to_air_response.g.dart';

@JsonSerializable()
class TvEpisodeToAirResponse extends Equatable {
  int? id;
  String? name;
  String? overview;
  int? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  dynamic runtime;
  int? seasonNumber;
  int? showId;
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
