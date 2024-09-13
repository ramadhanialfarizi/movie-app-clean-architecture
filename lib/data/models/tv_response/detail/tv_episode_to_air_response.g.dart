// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode_to_air_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvEpisodeToAirResponse _$TvEpisodeToAirResponseFromJson(
        Map<String, dynamic> json) =>
    TvEpisodeToAirResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toInt(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      airDate: json['airDate'] as String?,
      episodeNumber: (json['episodeNumber'] as num?)?.toInt(),
      episodeType: json['episodeType'] as String?,
      productionCode: json['productionCode'] as String?,
      runtime: json['runtime'],
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      showId: (json['showId'] as num?)?.toInt(),
      stillPath: json['stillPath'],
    );

Map<String, dynamic> _$TvEpisodeToAirResponseToJson(
        TvEpisodeToAirResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'airDate': instance.airDate,
      'episodeNumber': instance.episodeNumber,
      'episodeType': instance.episodeType,
      'productionCode': instance.productionCode,
      'runtime': instance.runtime,
      'seasonNumber': instance.seasonNumber,
      'showId': instance.showId,
      'stillPath': instance.stillPath,
    };
