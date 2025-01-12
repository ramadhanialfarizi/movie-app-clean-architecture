import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/watchlist/tv_table_data.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_item_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource tvRemoteDataSource;
  final TvLocalDataSource localDataSource;

  TvRepositoryImpl({
    required this.tvRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, TvListModel>> getPopularTvShow() async {
    try {
      final result = await tvRemoteDataSource.getPopularTvShow();

      List<TvItemModel> dataItem = [];
      TvListModel dataList = TvListModel();

      result.results?.forEach(
        (element) {
          TvItemModel data = TvItemModel();
          data.adult = element.adult;
          data.backdropPath = element.backdropPath;
          data.firstAirDate = element.firstAirDate.toString();
          data.genreIds = element.genreIds;
          data.id = element.id;
          data.name = element.name;
          data.originCountry = element.originCountry;
          data.originalLanguage = element.originalLanguage;
          data.originalName = element.originalName;
          data.overview = element.overview;
          data.popularity = element.popularity;
          data.posterPath = element.posterPath;

          dataItem.add(data);
        },
      );

      dataList.page = result.page;
      dataList.results = dataItem;
      dataList.totalPages = result.totalPages;
      dataList.totalResults = result.totalResults;

      return Right(dataList);
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
  Future<Either<Failure, TvListModel>> getTopRatedTvShow() async {
    try {
      final result = await tvRemoteDataSource.getTopRatedTvShow();
      List<TvItemModel> dataItem = [];
      TvListModel dataList = TvListModel();

      result.results?.forEach(
        (element) {
          TvItemModel data = TvItemModel();
          data.adult = element.adult;
          data.backdropPath = element.backdropPath;
          data.firstAirDate = element.firstAirDate.toString();
          data.genreIds = element.genreIds;
          data.id = element.id;
          data.name = element.name;
          data.originCountry = element.originCountry;
          data.originalLanguage = element.originalLanguage;
          data.originalName = element.originalName;
          data.overview = element.overview;
          data.popularity = element.popularity;
          data.posterPath = element.posterPath;

          dataItem.add(data);
        },
      );

      dataList.page = result.page;
      dataList.results = dataItem;
      dataList.totalPages = result.totalPages;
      dataList.totalResults = result.totalResults;

      return Right(dataList);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvListModel>> getOnAirTvShow() async {
    try {
      final result = await tvRemoteDataSource.getOnAirTvShow();
      List<TvItemModel> dataItem = [];
      TvListModel dataList = TvListModel();

      result.results?.forEach(
        (element) {
          TvItemModel data = TvItemModel();
          data.adult = element.adult;
          data.backdropPath = element.backdropPath;
          data.firstAirDate = element.firstAirDate.toString();
          data.genreIds = element.genreIds;
          data.id = element.id;
          data.name = element.name;
          data.originCountry = element.originCountry;
          data.originalLanguage = element.originalLanguage;
          data.originalName = element.originalName;
          data.overview = element.overview;
          data.popularity = element.popularity;
          data.posterPath = element.posterPath;

          dataItem.add(data);
        },
      );

      dataList.page = result.page;
      dataList.results = dataItem;
      dataList.totalPages = result.totalPages;
      dataList.totalResults = result.totalResults;

      return Right(dataList);
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
  Future<Either<Failure, TvListModel>> searchTv(String query) async {
    try {
      final result = await tvRemoteDataSource.searchTv(query);

      List<TvItemModel> dataItem = [];
      TvListModel dataList = TvListModel();

      result.results?.forEach(
        (element) {
          TvItemModel data = TvItemModel();
          data.adult = element.adult;
          data.backdropPath = element.backdropPath;
          data.firstAirDate = element.firstAirDate;
          data.genreIds = element.genreIds;
          data.id = element.id;
          // data.mediaType = element.
          data.name = element.name;
          data.originCountry = element.originCountry;
          data.originalLanguage = element.originalLanguage;
          data.originalName = element.originalName;
          data.overview = element.overview;
          data.popularity = element.popularity;
          data.posterPath = element.posterPath;

          dataItem.add(data);
        },
      );

      dataList.page = result.page;
      dataList.results = dataItem;
      dataList.totalPages = result.totalPages;
      dataList.totalResults = result.totalResults;

      return Right(dataList);
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
