// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonResponse _$SeasonResponseFromJson(Map<String, dynamic> json) =>
    SeasonResponse(
      airDate: json['airDate'] as String?,
      episodeCount: (json['episodeCount'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SeasonResponseToJson(SeasonResponse instance) =>
    <String, dynamic>{
      'airDate': instance.airDate,
      'episodeCount': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'seasonNumber': instance.seasonNumber,
      'voteAverage': instance.voteAverage,
    };
