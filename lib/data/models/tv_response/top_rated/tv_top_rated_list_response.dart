import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_data_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_top_rated_list_response.g.dart';

@JsonSerializable()
class TvTopRatedListResponse extends Equatable {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<TvTopRatedDataResponse>? results;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  TvTopRatedListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvTopRatedListResponse.fromJson(Map<String, dynamic> json) =>
      _$TvTopRatedListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvTopRatedListResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
