import 'dart:convert';
import 'dart:developer';

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
  static const API_KEY = 'api_key=934f6ae90b94cf8745cbf08959893556';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvRemoteDataSourceImpl({required this.client});

  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzRmNmFlOTBiOTRjZjg3NDVjYmYwODk1OTg5MzU1NiIsIm5iZiI6MTcyODQ4NjYxNi43Mjc5NzUsInN1YiI6IjY0MzdkYzIyMWQ1Mzg2MDA3N2E0NGVmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JS9Cjy9uR50XB_Ecepzl1BgJYx8c2SA1MyGSGLd1NNE',
    'accept': 'application/json',
  };

  @override
  Future<TvPopularListResponse> getPopularTvShow() async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/tv/popular?$API_KEY'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        log("data : ${jsonEncode(response.body)}");
        return TvPopularListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      log("error : $e");
      rethrow;
    }
  }

  @override
  Future<TvOnAirListResponse> getOnAirTvShow() async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'),
        headers: headers,
      );

      log("status code : ${response.statusCode}");

      if (response.statusCode == 200) {
        log("data : ${jsonEncode(jsonDecode(response.body))}");
        return TvOnAirListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      log("error : $e");
      rethrow;
    }
  }

  @override
  Future<TvTopRatedListResponse> getTopRatedTvShow() async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'),
        headers: headers,
      );

      log("status code : ${response.statusCode}");

      if (response.statusCode == 200) {
        return TvTopRatedListResponse.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      log("error : $e");
      rethrow;
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
