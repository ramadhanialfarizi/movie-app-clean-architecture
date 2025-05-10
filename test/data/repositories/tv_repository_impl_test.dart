import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvRepositoryImpl tvRepository;
  late MockTvLocalDataSource mockTvLocalDataSource;
  late MockTvRemoteDataSource mockTvRemoteDataSource;

  setUp(
    () {
      mockTvRemoteDataSource = MockTvRemoteDataSource();
      mockTvLocalDataSource = MockTvLocalDataSource();
      tvRepository = TvRepositoryImpl(
        tvRemoteDataSource: mockTvRemoteDataSource,
        localDataSource: mockTvLocalDataSource,
      );
    },
  );

  group(
    "Now playing tv show",
    () {
      test(
        "should return tv show now playing data",
        () async {
          when(mockTvRemoteDataSource.getOnAirTvShow()).thenAnswer(
            (_) async => tvOnAirListResponse,
          );

          final result = await tvRepository.getOnAirTvShow();

          verify(mockTvRemoteDataSource.getOnAirTvShow());

          final resultList = result.getOrElse(
            () => TvListModel(),
          );

          expect(resultList, tvListModel);
        },
      );

      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.getOnAirTvShow()).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.getOnAirTvShow();
          verify(mockTvRemoteDataSource.getOnAirTvShow());
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.getOnAirTvShow()).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await await tvRepository.getOnAirTvShow();
          verify(mockTvRemoteDataSource.getOnAirTvShow());
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  group(
    "Popular TV show",
    () {
      test(
        "should return tv popular list data",
        () async {
          when(mockTvRemoteDataSource.getPopularTvShow()).thenAnswer(
            (_) async => tvPopularListResponse,
          );

          final result = await tvRepository.getPopularTvShow();

          verify(mockTvRemoteDataSource.getPopularTvShow());

          final resultList = result.getOrElse(
            () => TvListModel(),
          );

          expect(resultList, tvListModel);
        },
      );
      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.getPopularTvShow()).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.getPopularTvShow();
          verify(mockTvRemoteDataSource.getPopularTvShow());
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.getPopularTvShow()).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await await tvRepository.getPopularTvShow();
          verify(mockTvRemoteDataSource.getPopularTvShow());
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  group(
    "Top Rated Tv Show",
    () {
      test(
        "should return Top Rated list data",
        () async {
          when(mockTvRemoteDataSource.getTopRatedTvShow()).thenAnswer(
            (_) async => tvTopRatedListResponse,
          );

          final result = await tvRepository.getTopRatedTvShow();

          verify(mockTvRemoteDataSource.getTopRatedTvShow());

          final resultList = result.getOrElse(
            () => TvListModel(),
          );

          expect(resultList, tvListModel);
        },
      );

      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.getTopRatedTvShow()).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.getTopRatedTvShow();
          verify(mockTvRemoteDataSource.getTopRatedTvShow());
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.getTopRatedTvShow()).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await await tvRepository.getTopRatedTvShow();
          verify(mockTvRemoteDataSource.getTopRatedTvShow());
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  group(
    "get recomendation tv show",
    () {
      int id = 1111;
      test(
        "should return Top Rated list data",
        () async {
          when(mockTvRemoteDataSource.getRecomendationTvShow(id)).thenAnswer(
            (_) async => tvRecomendationListResponse,
          );

          final result = await tvRepository.getRecomendationTvShow(id);

          verify(mockTvRemoteDataSource.getRecomendationTvShow(id));

          final resultList = result.getOrElse(
            () => TvListModel(),
          );

          expect(resultList, tvListModel);
        },
      );

      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.getRecomendationTvShow(id)).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.getRecomendationTvShow(id);
          verify(mockTvRemoteDataSource.getRecomendationTvShow(id));
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.getRecomendationTvShow(id)).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await await tvRepository.getRecomendationTvShow(id);
          verify(mockTvRemoteDataSource.getRecomendationTvShow(id));
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  group(
    "get detail tv show",
    () {
      int id = 1111;

      test(
        "should return detail tv show",
        () async {
          when(mockTvRemoteDataSource.getDetailTvShow(id)).thenAnswer(
            (_) async => tvDummyDetail,
          );

          final result = await tvRepository.getDetailTvShow(id);

          verify(mockTvRemoteDataSource.getDetailTvShow(id));

          final resultList = result.getOrElse(
            () => TvDetailModel(),
          );

          expect(resultList, tvDetailModel);
        },
      );

      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.getDetailTvShow(id)).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.getDetailTvShow(id);
          verify(mockTvRemoteDataSource.getDetailTvShow(id));
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.getDetailTvShow(id)).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await await tvRepository.getDetailTvShow(id);
          verify(mockTvRemoteDataSource.getDetailTvShow(id));
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  group(
    "search tv show",
    () {
      String query = "titanic";
      test(
        "should return search tv show",
        () async {
          when(mockTvRemoteDataSource.searchTv(query)).thenAnswer(
            (_) async => searchTvListResponse,
          );

          final result = await tvRepository.searchTv(query);

          verify(mockTvRemoteDataSource.searchTv(query));

          final resultList = result.getOrElse(
            () => TvListModel(),
          );

          expect(resultList, tvListModel);
        },
      );
      test(
        "return server failure when remote data status is unsuccessfuly",
        () async {
          when(mockTvRemoteDataSource.searchTv(query)).thenThrow(
            ServerException(),
          );

          final result = await tvRepository.searchTv(query);
          verify(mockTvRemoteDataSource.searchTv(query));
          expect(result, equals(Left(ServerFailure(''))));
        },
      );

      test(
        "return connection failure when connection is not stable",
        () async {
          when(mockTvRemoteDataSource.searchTv(query)).thenThrow(
            SocketException('Failed to connect to the network'),
          );

          final result = await tvRepository.searchTv(query);
          verify(mockTvRemoteDataSource.searchTv(query));
          expect(
              result,
              equals(
                  Left(ConnectionFailure('Failed to connect to the network'))));
        },
      );
    },
  );

  test('should return list of TvWatchlistModel when data source returns data',
      () async {
    // arrange
    when(mockTvLocalDataSource.getWatchlistTv())
        .thenAnswer((_) async => [tvTableDataDummy]);

    // act
    final result = await tvRepository.getWatchlistTvShow();

    // assert
    result.fold(
      (failure) => fail('Should not return failure'),
      (tvList) {
        expect(tvList.length, 1);
        expect(tvList[0].id, 1);
        expect(tvList[0].title, 'title');
      },
    );
  });
}
