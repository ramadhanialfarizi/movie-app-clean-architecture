import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SearchTvShow {
  final TvRepository repository;

  SearchTvShow(this.repository);

  Future<Either<Failure, SearchTvListResponse>> executeProcess(String query) {
    return repository.searchTv(query);
  }
}
