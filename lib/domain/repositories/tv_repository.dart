import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';

abstract class TvRepository {
  Future<Either<Failure, TvPopularListResponse>> getPopularTvShow();
}
