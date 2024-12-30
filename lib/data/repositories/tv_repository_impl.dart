import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/data/models/tv_response/watchlist/tv_table_data.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource tvRemoteDataSource;
  final TvLocalDataSource localDataSource;

  TvRepositoryImpl({
    required this.tvRemoteDataSource,
    required this.localDataSource,
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
      int id) async {
    try {
      final result = await tvRemoteDataSource.getRecomendationTvShow(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvTopRatedListResponse>> getTopRatedTvShow() async {
    try {
      final result = await tvRemoteDataSource.getTopRatedTvShow();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvOnAirListResponse>> getOnAirTvShow() async {
    try {
      final result = await tvRemoteDataSource.getOnAirTvShow();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvDetailResponse>> getDetailTvShow(int id) async {
    try {
      final result = await tvRemoteDataSource.getDetailTvShow(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, SearchTvListResponse>> searchTv(String query) async {
    try {
      final result = await tvRemoteDataSource.searchTv(query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvTableData>>> getWatchlistTvShow() async {
    final result = await localDataSource.getWatchlistTv();

    return Right(result);
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getTvShowById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(
      TvDetailResponse tvDetail) async {
    try {
      MovieTable data = MovieTable(
        id: tvDetail.id ?? 0,
        title: tvDetail.name,
        posterPath: tvDetail.posterPath,
        overview: tvDetail.overview,
      );

      final result = await localDataSource.removeWatchlist(data);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(
      TvDetailResponse tvDetail) async {
    try {
      MovieTable data = MovieTable(
        id: tvDetail.id ?? 0,
        title: tvDetail.name,
        posterPath: tvDetail.posterPath,
        overview: tvDetail.overview,
      );

      final result = await localDataSource.insertWatchlist(data);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }
}
