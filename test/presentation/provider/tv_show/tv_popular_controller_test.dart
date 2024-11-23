import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_popular_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'tv_popular_controller_test.mocks.dart';

@GenerateMocks([GetTvShowPopular])
void main() {
  late TvPopularController controller;
  late MockGetTvShowPopular mockGetTvShowPopular;

  setUp(
    () {
      mockGetTvShowPopular = MockGetTvShowPopular();
      controller = TvPopularController(getTvShowPopular: mockGetTvShowPopular);
    },
  );

  group(
    "get popular tv show",
    () {
      test('should get data from the usecase', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvPopularListResponse));
        // act
        controller.loadTvPopularData();
        // assert
        verify(mockGetTvShowPopular.executeProcess());
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvPopularListResponse));
        // act
        controller.loadTvPopularData();
        // assert
        expect(controller.popularState, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Right(tvPopularListResponse));
        // act
        await controller.loadTvPopularData();
        // assert
        expect(controller.popularState, RequestState.Loaded);
        expect(controller.tvPopularListResponse, tvPopularListResponse);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockGetTvShowPopular.executeProcess())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.loadTvPopularData();
        // assert
        expect(controller.popularState, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );
}
