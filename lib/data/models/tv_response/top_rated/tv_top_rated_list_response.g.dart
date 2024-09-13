// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_top_rated_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvTopRatedListResponse _$TvTopRatedListResponseFromJson(
        Map<String, dynamic> json) =>
    TvTopRatedListResponse(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => TvTopRatedDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvTopRatedListResponseToJson(
        TvTopRatedListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
