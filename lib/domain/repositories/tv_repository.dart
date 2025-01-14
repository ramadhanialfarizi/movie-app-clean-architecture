import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/watchlist/tv_table_data.dart';
import 'package:ditonton/domain/entities/tv_entities/detail/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';

abstract class TvRepository {
  Future<Either<Failure, TvListModel>> getPopularTvShow();
  Future<Either<Failure, TvListModel>> getRecomendationTvShow(int id);
  Future<Either<Failure, TvListModel>> getTopRatedTvShow();
  Future<Either<Failure, TvListModel>> getOnAirTvShow();
  Future<Either<Failure, TvDetailModel>> getDetailTvShow(int id);
  Future<Either<Failure, TvListModel>> searchTv(String query);
  Future<Either<Failure, String>> saveWatchlist(TvDetailModel tvDetail);
  Future<Either<Failure, String>> removeWatchlist(TvDetailModel tvDetail);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<TvTableData>>> getWatchlistTvShow();
}
