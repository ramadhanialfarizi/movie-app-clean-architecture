// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguageResponse _$SpokenLanguageResponseFromJson(
        Map<String, dynamic> json) =>
    SpokenLanguageResponse(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageResponseToJson(
        SpokenLanguageResponse instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
