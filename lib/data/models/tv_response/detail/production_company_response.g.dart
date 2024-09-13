// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyResponse _$ProductionCompanyResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyResponse(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logoPath'] as String?,
      name: json['name'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyResponseToJson(
        ProductionCompanyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };
