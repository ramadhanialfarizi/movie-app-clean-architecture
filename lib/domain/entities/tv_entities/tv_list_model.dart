import 'package:ditonton/domain/entities/tv_entities/tv_item_model.dart';
import 'package:equatable/equatable.dart';

class TvListModel extends Equatable {
  int? page;

  List<TvItemModel>? results;

  int? totalPages;

  int? totalResults;

  TvListModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
