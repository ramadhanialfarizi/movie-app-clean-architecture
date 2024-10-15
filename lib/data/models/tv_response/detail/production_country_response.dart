import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_country_response.g.dart';

@JsonSerializable()
class ProductionCountryResponse extends Equatable {
  @JsonKey(name: "iso_3166_1")
  String? iso31661;
  @JsonKey(name: "name")
  String? name;

  ProductionCountryResponse({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
