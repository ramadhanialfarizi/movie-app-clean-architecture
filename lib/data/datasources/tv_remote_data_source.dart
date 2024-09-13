import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';

abstract class TvRemoteDataSource {
  Future<TvPopularListResponse> getPopularTvShow();
  Future<TvOnAirListResponse> getOnAirTvShow();
  Future<TvTopRatedListResponse> getTopRatedTvShow();
  Future<TvDetailResponse> getDetailTvShow(int id);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  @override
  Future<TvPopularListResponse> getPopularTvShow() {
    // TODO: implement getPopularTvShow
    throw UnimplementedError();
  }

  @override
  Future<TvOnAirListResponse> getOnAirTvShow() {
    // TODO: implement getOnAirTvShow
    throw UnimplementedError();
  }

  @override
  Future<TvTopRatedListResponse> getTopRatedTvShow() {
    // TODO: implement getTopRatedTvShow
    throw UnimplementedError();
  }

  @override
  Future<TvDetailResponse> getDetailTvShow(int id) {
    // TODO: implement getDetailTvShow
    throw UnimplementedError();
  }
}
