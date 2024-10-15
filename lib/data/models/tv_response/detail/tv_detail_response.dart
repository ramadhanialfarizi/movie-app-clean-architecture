import 'package:ditonton/data/models/tv_response/detail/created_by_response.dart';
import 'package:ditonton/data/models/tv_response/detail/genre_response.dart';
import 'package:ditonton/data/models/tv_response/detail/network_response.dart';
import 'package:ditonton/data/models/tv_response/detail/production_company_response.dart';
import 'package:ditonton/data/models/tv_response/detail/production_country_response.dart';
import 'package:ditonton/data/models/tv_response/detail/season_response.dart';
import 'package:ditonton/data/models/tv_response/detail/spoken_language_response.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_episode_to_air_response.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_detail_response.g.dart';

@JsonSerializable()
class TvDetailResponse extends Equatable {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "created_by")
  List<CreatedByResponse>? createdBy;
  @JsonKey(name: "episode_run_time")
  List<int>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  DateTime? firstAirDate;
  @JsonKey(name: "genres")
  List<GenreResponse>? genres;
  @JsonKey(name: "homepage")
  String? homepage;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "in_production")
  bool? inProduction;
  @JsonKey(name: "languages")
  List<String>? languages;
  @JsonKey(name: "last_air_date")
  DateTime? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  TvEpisodeToAirResponse? lastEpisodeToAir;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "next_episode_to_air")
  TvEpisodeToAirResponse? nextEpisodeToAir;
  @JsonKey(name: "networks")
  List<NetworkResponse>? networks;
  @JsonKey(name: "number_of_episodes")
  int? numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  int? numberOfSeasons;
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
  @JsonKey(name: "production_companies")
  List<NetworkResponse>? productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionCountryResponse>? productionCountries;
  @JsonKey(name: "seasons")
  List<SeasonResponse>? seasons;
  @JsonKey(name: "spoken_languages")
  List<SpokenLanguageResponse>? spokenLanguages;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "tagline")
  String? tagline;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  TvDetailResponse({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TvDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvDetailResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        adult,
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
