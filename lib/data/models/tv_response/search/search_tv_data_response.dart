import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_tv_data_response.g.dart';

@JsonSerializable()
class SearchTvDataResponse extends Equatable {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  SearchTvDataResponse({
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

  factory SearchTvDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTvDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchTvDataResponseToJson(this);

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
