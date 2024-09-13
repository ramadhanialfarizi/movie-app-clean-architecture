import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_data_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_top_rated_list_response.g.dart';

@JsonSerializable()
class TvTopRatedListResponse extends Equatable {
  int? page;
  List<TvTopRatedDataResponse>? results;
  int? totalPages;
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
