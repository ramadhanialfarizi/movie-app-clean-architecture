// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tv_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTvListResponse _$SearchTvListResponseFromJson(
        Map<String, dynamic> json) =>
    SearchTvListResponse(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SearchTvDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchTvListResponseToJson(
        SearchTvListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
