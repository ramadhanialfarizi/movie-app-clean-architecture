import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_data_response.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_on_air_list_response.g.dart';

@JsonSerializable()
class TvOnAirListResponse extends Equatable {
  int? page;
  List<TvOnAirDataResponse>? results;
  int? totalPages;
  int? totalResults;

  TvOnAirListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvOnAirListResponse.fromJson(Map<String, dynamic> json) =>
      _$TvOnAirListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvOnAirListResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
