// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_table_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvTableData _$TvTableDataFromJson(Map<String, dynamic> json) => TvTableData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      posterPath: json['posterPath'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$TvTableDataToJson(TvTableData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
    };
