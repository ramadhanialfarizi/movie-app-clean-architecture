import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:http/http.dart' as http;

abstract class TvRemoteDataSource {
  Future<TvPopularListResponse> getPopularTvShow();
  Future<TvOnAirListResponse> getOnAirTvShow();
  Future<TvTopRatedListResponse> getTopRatedTvShow();
  Future<TvDetailResponse> getDetailTvShow(int id);
  Future<TvRecomendationListResponse> getRecomendationTvShow(int id);
  Future<SearchTvListResponse> searchTv(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<TvPopularListResponse> getPopularTvShow() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/popular'));

    if (response.statusCode == 200) {
      return TvPopularListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvOnAirListResponse> getOnAirTvShow() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/on_the_air'));

    if (response.statusCode == 200) {
      return TvOnAirListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvTopRatedListResponse> getTopRatedTvShow() async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/top_rated'));

    if (response.statusCode == 200) {
      return TvTopRatedListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getDetailTvShow(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvRecomendationListResponse> getRecomendationTvShow(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/$id/recommendations'));

    if (response.statusCode == 200) {
      return TvRecomendationListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchTvListResponse> searchTv(String query) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/search/tv/?query=$query'));

    if (response.statusCode == 200) {
      return SearchTvListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
