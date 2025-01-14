import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/domain/entities/tv_entities/detail/tv_detail_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvShowDetail {
  final TvRepository repository;

  GetTvShowDetail(this.repository);

  Future<Either<Failure, TvDetailModel>> executeProcess(int id) {
    return repository.getDetailTvShow(id);
  }
}
