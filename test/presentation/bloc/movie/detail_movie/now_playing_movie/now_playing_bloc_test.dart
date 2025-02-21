import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movie/now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'now_playing_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
])
void main() {
  late NowPlayingBloc nowPlayingBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(
    () {
      mockGetNowPlayingMovies = MockGetNowPlayingMovies();
      nowPlayingBloc = NowPlayingBloc(
        mockGetNowPlayingMovies,
      );
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(nowPlayingBloc.state, NowPlayingEmpty());
    },
  );

  group(
    "loaded data for now playing movies",
    () {
      blocTest<NowPlayingBloc, NowPlayingState>(
        "success load Data",
        build: () {
          when(mockGetNowPlayingMovies.execute())
              .thenAnswer((_) async => Right(testMovieList));

          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlaying()),
        expect: () => [
          NowPlayingLoading(),
          NowPlayingHasData(testMovieList),
        ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      blocTest<NowPlayingBloc, NowPlayingState>(
        "Failed load Data server error",
        build: () {
          when(mockGetNowPlayingMovies.execute())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlaying()),
        expect: () => [
          NowPlayingLoading(),
          NowPlayingError(''),
        ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );

      blocTest<NowPlayingBloc, NowPlayingState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetNowPlayingMovies.execute()).thenAnswer((_) async => Left(
                ConnectionFailure('Failed to connect to the network'),
              ));

          return nowPlayingBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlaying()),
        expect: () => [
          NowPlayingLoading(),
          NowPlayingError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetNowPlayingMovies.execute());
        },
      );
    },
  );
}
