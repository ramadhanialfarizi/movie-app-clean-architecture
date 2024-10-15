// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyResponse _$ProductionCompanyResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyResponse(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyResponseToJson(
        ProductionCompanyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
