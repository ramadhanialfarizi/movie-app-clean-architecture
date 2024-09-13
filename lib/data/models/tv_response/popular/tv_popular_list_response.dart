import 'package:ditonton/data/models/tv_response/popular/tv_popular_data_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_popular_list_response.g.dart';

@JsonSerializable()
class TvPopularListResponse extends Equatable {
  int? page;
  List<TvPopularDataResponse>? results;
  int? totalPages;
  int? totalResults;

  TvPopularListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvPopularListResponse.fromJson(Map<String, dynamic> json) =>
      _$TvPopularListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvPopularListResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
