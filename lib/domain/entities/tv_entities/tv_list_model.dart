import 'package:ditonton/domain/entities/tv_entities/tv_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_list_model.g.dart';

@JsonSerializable()
class TvListModel {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<TvItemModel>? results;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  TvListModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvListModel.fromJson(Map<String, dynamic> json) =>
      _$TvListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvListModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
