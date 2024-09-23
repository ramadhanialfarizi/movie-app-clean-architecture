import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowTopRated {
  final TvRepository repository;

  GetTvShowTopRated(this.repository);

  Future<Either<Failure, TvTopRatedListResponse>> executeProcess() {
    return repository.getTopRatedTvShow();
  }
}
