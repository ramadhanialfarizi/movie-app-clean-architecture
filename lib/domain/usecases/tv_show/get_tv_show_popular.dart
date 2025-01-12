import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowPopular {
  final TvRepository repository;

  GetTvShowPopular(this.repository);

  Future<Either<Failure, TvListModel>> executeProcess() {
    return repository.getPopularTvShow();
  }
}
