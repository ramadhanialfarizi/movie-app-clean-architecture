// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_recomendation_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvRecomendationDataResponse _$TvRecomendationDataResponseFromJson(
        Map<String, dynamic> json) =>
    TvRecomendationDataResponse(
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
      adult: json['adult'] as bool?,
      originalLanguage: json['original_language'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TvRecomendationDataResponseToJson(
        TvRecomendationDataResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'origin_country': instance.originCountry,
    };
