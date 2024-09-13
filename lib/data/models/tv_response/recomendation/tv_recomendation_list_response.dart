import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_data_response.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tv_recomendation_list_response.g.dart';

@JsonSerializable()
class TvRecomendationListResponse extends Equatable {
  int? page;
  List<TvRecomendationDataResponse>? results;
  int? totalPages;
  int? totalResults;

  TvRecomendationListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvRecomendationListResponse.fromJson(Map<String, dynamic> json) =>
      _$TvRecomendationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvRecomendationListResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
