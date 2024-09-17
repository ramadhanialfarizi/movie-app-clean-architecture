import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  @override
  Future<Either<Failure, TvPopularListResponse>> getPopularTvShow() {
    // TODO: implement getPopularTvShow
    throw UnimplementedError();
  }
}
