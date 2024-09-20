import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';

abstract class TvRepository {
  Future<Either<Failure, TvPopularListResponse>> getPopularTvShow();
  Future<Either<Failure, TvRecomendationListResponse>> getRecomendationTvShow();
  Future<Either<Failure, TvTopRatedListResponse>> getTopRatedTvShow();
  Future<Either<Failure, TvOnAirListResponse>> getOnAirTvShow();
  Future<Either<Failure, TvDetailResponse>> getDetailTvShow(int id);
}
