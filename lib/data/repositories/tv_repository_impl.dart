import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource tvRemoteDataSource;

  TvRepositoryImpl({
    required this.tvRemoteDataSource,
  });

  @override
  Future<Either<Failure, TvPopularListResponse>> getPopularTvShow() async {
    try {
      final result = await tvRemoteDataSource.getPopularTvShow();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvRecomendationListResponse>> getRecomendationTvShow(
      int id) {
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
