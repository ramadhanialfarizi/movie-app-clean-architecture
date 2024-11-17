import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  // const API_KEY = 'api_key=934f6ae90b94cf8745cbf08959893556';
  const BASE_URL = 'https://api.themoviedb.org/3';

  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzRmNmFlOTBiOTRjZjg3NDVjYmYwODk1OTg5MzU1NiIsIm5iZiI6MTcyODQ4NjYxNi43Mjc5NzUsInN1YiI6IjY0MzdkYzIyMWQ1Mzg2MDA3N2E0NGVmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JS9Cjy9uR50XB_Ecepzl1BgJYx8c2SA1MyGSGLd1NNE',
    'accept': 'application/json',
  };

  late TvRemoteDataSourceImpl dataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(
    () {
      mockHttpClient = MockHttpClient();
      dataSourceImpl = TvRemoteDataSourceImpl(client: mockHttpClient);
    },
  );

  group(
    "get now playing tv show",
    () {
      final tvShowOnAirList = TvOnAirListResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_now_playing.json')));

      test(
        "should return tv show on air list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/on_the_air'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_now_playing.json'), 200));
          // act
          final result = await dataSourceImpl.getOnAirTvShow();
          // assert
          expect(result, equals(tvShowOnAirList));
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/on_the_air'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getOnAirTvShow();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    "Get Popular Tv show",
    () {
      final tvShowPopular = TvPopularListResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_popular.json')));

      test(
        "should return tv show popular list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/popular'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_popular.json'), 200));
          // act
          final result = await dataSourceImpl.getPopularTvShow();
          // assert
          expect(result, equals(tvShowPopular));
        },
      );

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/popular'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getPopularTvShow();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    "Get Popular Tv show",
    () {
      final tvShowPopular = TvPopularListResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_popular.json')));

      test(
        "should return tv show popular list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/popular'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_popular.json'), 200));
          // act
          final result = await dataSourceImpl.getPopularTvShow();
          // assert
          expect(result, equals(tvShowPopular));
        },
      );

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/popular'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getPopularTvShow();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    "Get top rated Tv show",
    () {
      final tvShowPopular = TvTopRatedListResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_top_rated.json')));

      test(
        "should return tv top rated list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/top_rated'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_top_rated.json'), 200));
          // act
          final result = await dataSourceImpl.getTopRatedTvShow();
          // assert
          expect(result, equals(tvShowPopular));
        },
      );

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/top_rated'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getTopRatedTvShow();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    "get detail tv show",
    () {
      int id = 1396;

      final tvShowDetail = TvDetailResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_detail.json')));

      test(
        "should return tv show popular list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/$id'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_detail.json'), 200));
          // act
          final result = await dataSourceImpl.getDetailTvShow(id);
          // assert
          expect(result, equals(tvShowDetail));
        },
      );

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$id'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getDetailTvShow(id);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    'get recomendation tv show',
    () {
      int id = 1396;

      final tvShowRecomendation = TvRecomendationListResponse.fromJson(
          jsonDecode(readJson('dummy_data/tv_dummy/tv_recommendation.json')));

      test(
        "should return tv show recomendation list data",
        () async {
          // arrange
          when(mockHttpClient.get(
            Uri.parse('$BASE_URL/tv/$id/recommendations'),
            headers: headers,
          )).thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_dummy/tv_recommendation.json'), 200));
          // act
          final result = await dataSourceImpl.getRecomendationTvShow(id);
          // assert
          expect(result, equals(tvShowRecomendation));
        },
      );

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/tv/$id/recommendations'),
          headers: headers,
        )).thenAnswer((_) async => http.Response('Not Found', 404));
        // act
        final call = dataSourceImpl.getRecomendationTvShow(id);
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      });
    },
  );

  group(
    "search tv show",
    () {},
  );
}
