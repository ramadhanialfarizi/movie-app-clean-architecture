import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  @override
  Future<Either<Failure, TvPopularListResponse>> getPopularTvShow() {
    // TODO: implement getPopularTvShow
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvRecomendationListResponse>>
      getRecomendationTvShow() {
    // TODO: implement getRecomendationTvShow
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvTopRatedListResponse>> getTopRatedTvShow() {
    // TODO: implement getTopRatedTvShow
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvOnAirListResponse>> getOnAirTvShow() {
    // TODO: implement getOnAirTvShow
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvDetailResponse>> getDetailTvShow(int id) {
    // TODO: implement getDetailTvShow
    throw UnimplementedError();
  }
}
