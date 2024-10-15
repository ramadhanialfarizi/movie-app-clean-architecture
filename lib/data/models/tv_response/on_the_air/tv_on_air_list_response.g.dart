// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_on_air_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvOnAirListResponse _$TvOnAirListResponseFromJson(Map<String, dynamic> json) =>
    TvOnAirListResponse(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TvOnAirDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvOnAirListResponseToJson(
        TvOnAirListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
