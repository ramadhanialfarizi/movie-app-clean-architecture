import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_top_rated_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'tv_top_rated_controller_test.mocks.dart';

@GenerateMocks([GetTvShowTopRated])
void main() {
  late TvTopRatedController controller;
  late MockGetTvShowTopRated mockGetTvShowTopRated;

  setUp(
    () {
      mockGetTvShowTopRated = MockGetTvShowTopRated();
      controller = TvTopRatedController(
        getTvTopRated: mockGetTvShowTopRated,
      );
    },
  );

  group(
    "get top rated tv show",
    () {
      test('should get data from the usecase', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvTopRatedListResponse));
        // act
        controller.loadTvShowTopRated();
        // assert
        verify(mockGetTvShowTopRated.executeProcess());
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvTopRatedListResponse));
        // act
        controller.loadTvShowTopRated();
        // assert
        expect(controller.state, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Right(tvTopRatedListResponse));
        // act
        await controller.loadTvShowTopRated();
        // assert
        expect(controller.state, RequestState.Loaded);
        expect(controller.tvTopRated, tvTopRatedListResponse);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockGetTvShowTopRated.executeProcess())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.loadTvShowTopRated();
        // assert
        expect(controller.state, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );
}
