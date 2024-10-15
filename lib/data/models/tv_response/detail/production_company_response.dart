import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'production_company_response.g.dart';

@JsonSerializable()
class ProductionCompanyResponse extends Equatable {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "logo_path")
  String? logoPath;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "origin_country")
  String? originCountry;

  ProductionCompanyResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}
