import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_on_air_data_response.g.dart';

@JsonSerializable()
class TvOnAirDataResponse extends Equatable {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "origin_country")
  List<String>? originCountry;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "first_air_date")
  DateTime? firstAirDate;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  TvOnAirDataResponse({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory TvOnAirDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TvOnAirDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvOnAirDataResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        voteAverage,
        voteCount,
      ];
}
