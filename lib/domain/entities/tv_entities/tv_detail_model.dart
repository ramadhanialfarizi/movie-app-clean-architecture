import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetailModel extends Equatable {
  String? name;
  List<Genre>? genre;
  double? voteAverage;
  String? posterPath;
  String? overview;
  int? id;

  TvDetailModel({
    this.genre,
    this.name,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        overview,
        posterPath,
        voteAverage,
        id,
      ];
}
