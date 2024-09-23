import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowRecomendation {
  final TvRepository repository;

  GetTvShowRecomendation(this.repository);

  Future<Either<Failure, TvRecomendationListResponse>> executeProcess(int id) {
    return repository.getRecomendationTvShow(id);
  }
}
