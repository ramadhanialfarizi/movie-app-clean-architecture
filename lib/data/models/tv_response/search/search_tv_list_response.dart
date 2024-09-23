import 'package:ditonton/data/models/tv_response/search/search_tv_data_response.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_tv_list_response.g.dart';

@JsonSerializable()
class SearchTvListResponse extends Equatable {
  int? page;
  List<SearchTvDataResponse>? results;
  int? totalPages;
  int? totalResults;

  SearchTvListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchTvListResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTvListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchTvListResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
