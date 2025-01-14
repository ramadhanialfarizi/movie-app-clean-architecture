import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_show_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'tv_show_controller_test.mocks.dart';

@GenerateMocks([
  GetTvShowOnAir,
  GetTvShowPopular,
  GetTvShowTopRated,
])
void main() {
  late TvShowController controller;
  late MockGetTvShowOnAir mockGetTvShowOnAir;
  late MockGetTvShowPopular mockGetTvShowPopular;
  late MockGetTvShowTopRated mockGetTvShowTopRated;

  setUp(
    () {
      mockGetTvShowTopRated = MockGetTvShowTopRated();
      mockGetTvShowPopular = MockGetTvShowPopular();
      mockGetTvShowOnAir = MockGetTvShowOnAir();
      controller = TvShowController(
        getTvShowOnAir: mockGetTvShowOnAir,
        getTvShowPopular: mockGetTvShowPopular,
        getTvShowTopRated: mockGetTvShowTopRated,
      );
    },
  );

  group(
    "Get Now Playing TV show",
    () {
      test('should get data from the usecase', () async {
        // arrange
        when(mockGetTvShowOnAir.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTVShowOnAir();
        // assert
        verify(mockGetTvShowOnAir.executeProcess());
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockGetTvShowOnAir.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTVShowOnAir();
        // assert
        expect(controller.tvOnAirState, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockGetTvShowOnAir.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        await controller.loadTVShowOnAir();
        // assert
        expect(controller.tvOnAirState, RequestState.Loaded);
        expect(controller.tvOnAirListResponse, tvListModel);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockGetTvShowOnAir.executeProcess())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.loadTVShowOnAir();
        // assert
        expect(controller.tvOnAirState, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );

  group(
    "get popular tv show",
    () {
      test('should get data from the usecase', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTvShowPopular();
        // assert
        verify(mockGetTvShowPopular.executeProcess());
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTvShowPopular();
        // assert
        expect(controller.tvPopularState, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        await controller.loadTvShowPopular();
        // assert
        expect(controller.tvPopularState, RequestState.Loaded);
        expect(controller.tvPopularListResponse, tvListModel);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.loadTvShowPopular();
        // assert
        expect(controller.tvPopularState, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );

  group(
    "get top rated tv show",
    () {
      test('should get data from the usecase', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTvShowTopRated();
        // assert
        verify(mockGetTvShowTopRated.executeProcess());
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.loadTvShowTopRated();
        // assert
        expect(controller.tvTopRatedState, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvListModel));
        // act
        await controller.loadTvShowTopRated();
        // assert
        expect(controller.tvTopRatedState, RequestState.Loaded);
        expect(controller.tvTopRatedListResponse, tvListModel);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.loadTvShowTopRated();
        // assert
        expect(controller.tvTopRatedState, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );
}
