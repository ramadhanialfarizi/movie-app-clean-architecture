// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_popular_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvPopularListResponse _$TvPopularListResponseFromJson(
        Map<String, dynamic> json) =>
    TvPopularListResponse(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => TvPopularDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvPopularListResponseToJson(
        TvPopularListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
