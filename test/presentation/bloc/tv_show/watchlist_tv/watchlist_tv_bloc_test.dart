import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tv_show/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'watchlist_tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchlistTv,
])
void main() {
  late WatchlistTvBloc watchlistTvBloc;
  late MockGetWatchlistTv mockGetWatchlistTv;

  setUp(
    () {
      mockGetWatchlistTv = MockGetWatchlistTv();
      watchlistTvBloc = WatchlistTvBloc(mockGetWatchlistTv);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(watchlistTvBloc.state, WatchlistTvEmpty());
    },
  );

  group(
    "test bloc state management",
    () {
      blocTest<WatchlistTvBloc, WatchlistTvState>(
        "Success load data",
        build: () {
          when(mockGetWatchlistTv.execute()).thenAnswer(
            (_) async => Right([tvWatchlistModel]),
          );

          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(OnloadWatchlistTv()),
        expect: () => [
          WatchlistTvLoading(),
          WatchlistTvHasData([tvWatchlistModel]),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTv.execute());
        },
      );

      blocTest<WatchlistTvBloc, WatchlistTvState>(
        "Failed load Data server error",
        build: () {
          when(mockGetWatchlistTv.execute())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(OnloadWatchlistTv()),
        expect: () => [
          WatchlistTvLoading(),
          WatchlistTvError(''),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTv.execute());
        },
      );

      blocTest<WatchlistTvBloc, WatchlistTvState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetWatchlistTv.execute()).thenAnswer((_) async => Left(
                ConnectionFailure('Failed to connect to the network'),
              ));

          return watchlistTvBloc;
        },
        act: (bloc) => bloc.add(OnloadWatchlistTv()),
        expect: () => [
          WatchlistTvLoading(),
          WatchlistTvError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTv.execute());
        },
      );
    },
  );
}
