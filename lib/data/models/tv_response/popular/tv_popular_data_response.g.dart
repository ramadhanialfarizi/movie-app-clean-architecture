// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_popular_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvPopularDataResponse _$TvPopularDataResponseFromJson(
        Map<String, dynamic> json) =>
    TvPopularDataResponse(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      firstAirDate: json['firstAirDate'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      name: json['name'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvPopularDataResponseToJson(
        TvPopularDataResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'name': instance.name,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
