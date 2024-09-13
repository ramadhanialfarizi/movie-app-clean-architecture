import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'network_response.g.dart';

@JsonSerializable()
class NetworkResponse extends Equatable {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  NetworkResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}
