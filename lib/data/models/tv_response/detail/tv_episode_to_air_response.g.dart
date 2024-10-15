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
      voteAverage: (json['vote_average'] as num?)?.toInt(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num?)?.toInt(),
      episodeType: json['episode_type'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      showId: (json['show_id'] as num?)?.toInt(),
      stillPath: json['still_path'],
    );

Map<String, dynamic> _$TvEpisodeToAirResponseToJson(
        TvEpisodeToAirResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
    };
