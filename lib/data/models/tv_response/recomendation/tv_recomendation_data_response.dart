import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_recomendation_data_response.g.dart';

@JsonSerializable()
class TvRecomendationDataResponse extends Equatable {
  String? backdropPath;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  DateTime? firstAirDate;
  double? voteAverage;
  int? voteCount;
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
