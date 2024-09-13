// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_recomendation_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvRecomendationListResponse _$TvRecomendationListResponseFromJson(
        Map<String, dynamic> json) =>
    TvRecomendationListResponse(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              TvRecomendationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvRecomendationListResponseToJson(
        TvRecomendationListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };
