// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_recomendation_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvRecomendationDataResponse _$TvRecomendationDataResponseFromJson(
        Map<String, dynamic> json) =>
    TvRecomendationDataResponse(
      backdropPath: json['backdropPath'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      mediaType: json['mediaType'] as String?,
      adult: json['adult'] as bool?,
      originalLanguage: json['originalLanguage'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['firstAirDate'] == null
          ? null
          : DateTime.parse(json['firstAirDate'] as String),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TvRecomendationDataResponseToJson(
        TvRecomendationDataResponse instance) =>
    <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'mediaType': instance.mediaType,
      'adult': instance.adult,
      'originalLanguage': instance.originalLanguage,
      'genreIds': instance.genreIds,
      'popularity': instance.popularity,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'originCountry': instance.originCountry,
    };
