import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SearchTvShow {
  final TvRepository repository;

  SearchTvShow(this.repository);

  Future<Either<Failure, TvListModel>> executeProcess(String query) {
    return repository.searchTv(query);
  }
}
