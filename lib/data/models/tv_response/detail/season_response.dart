import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_response.g.dart';

@JsonSerializable()
class SeasonResponse extends Equatable {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  double? voteAverage;

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
