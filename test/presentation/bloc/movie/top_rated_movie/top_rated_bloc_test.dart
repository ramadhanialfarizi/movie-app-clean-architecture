import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movie/top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'top_rated_bloc_test.mocks.dart';

@GenerateMocks([
  GetTopRatedMovies,
])
void main() {
  late TopRatedBloc topRatedBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(
    () {
      mockGetTopRatedMovies = MockGetTopRatedMovies();
      topRatedBloc = TopRatedBloc(mockGetTopRatedMovies);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(topRatedBloc.state, TopRatedEmpty());
    },
  );

  group(
    "loaded data from top rated movie",
    () {
      blocTest<TopRatedBloc, TopRatedState>(
        "success load Data",
        build: () {
          when(mockGetTopRatedMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));

          return topRatedBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRated()),
        expect: () => [
          TopRatedLoading(),
          TopRatedHasData(testMovieList),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      blocTest<TopRatedBloc, TopRatedState>(
        "Failed load Data server error",
        build: () {
          when(mockGetTopRatedMovies.execute())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return topRatedBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRated()),
        expect: () => [
          TopRatedLoading(),
          TopRatedError(''),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );

      blocTest<TopRatedBloc, TopRatedState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Left(
                ConnectionFailure('Failed to connect to the network'),
              ));

          return topRatedBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRated()),
        expect: () => [
          TopRatedLoading(),
          TopRatedError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetTopRatedMovies.execute());
        },
      );
    },
  );
}
