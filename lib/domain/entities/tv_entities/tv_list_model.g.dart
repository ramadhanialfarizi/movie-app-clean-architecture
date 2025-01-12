// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvListModel _$TvListModelFromJson(Map<String, dynamic> json) => TvListModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TvItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvListModelToJson(TvListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
