import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_recomendation_data_response.g.dart';

@JsonSerializable()
class TvRecomendationDataResponse extends Equatable {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "media_type")
  String? mediaType;
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "first_air_date")
  DateTime? firstAirDate;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(name: "origin_country")
  List<String>? originCountry;

  TvRecomendationDataResponse({
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory TvRecomendationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TvRecomendationDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvRecomendationDataResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        name,
        originalName,
        overview,
        posterPath,
        mediaType,
        adult,
        originalLanguage,
        genreIds,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        originCountry,
      ];
}
