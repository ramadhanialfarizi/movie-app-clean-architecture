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
  bool? adult;
  String? backdropPath;
  List<CreatedByResponse>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<GenreResponse>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  TvEpisodeToAirResponse? lastEpisodeToAir;
  String? name;
  TvEpisodeToAirResponse? nextEpisodeToAir;
  List<NetworkResponse>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanyResponse>? productionCompanies;
  List<ProductionCountryResponse>? productionCountries;
  List<SeasonResponse>? seasons;
  List<SpokenLanguageResponse>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
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
