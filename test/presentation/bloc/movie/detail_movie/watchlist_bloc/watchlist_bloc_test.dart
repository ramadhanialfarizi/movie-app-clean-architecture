import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/watchlist_bloc/watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late WatchlistBloc watchlistBloc;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(
    () {
      mockGetWatchListStatus = MockGetWatchListStatus();
      mockRemoveWatchlist = MockRemoveWatchlist();
      mockSaveWatchlist = MockSaveWatchlist();
      watchlistBloc = WatchlistBloc(
        mockGetWatchListStatus,
        mockSaveWatchlist,
        mockRemoveWatchlist,
      );
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(watchlistBloc.state, WatchlistInitial());
    },
  );

  group('WatchlistEvent', () {
    test('AddToWatchlist props should contain movie', () {
      final event = AddToWatchlist(testMovieDetail);
      expect(event.props, [testMovieDetail]);
    });

    test('AddToWatchlist should support value equality', () {
      expect(AddToWatchlist(testMovieDetail), AddToWatchlist(testMovieDetail));
    });

    test('RemoveFromWatchlist props should contain movie', () {
      final event = RemoveFromWatchlist(testMovieDetail);
      expect(event.props, [testMovieDetail]);
    });

    test('RemoveFromWatchlist should support value equality', () {
      expect(RemoveFromWatchlist(testMovieDetail),
          RemoveFromWatchlist(testMovieDetail));
    });

    test('LoadWatchlistStatus props should contain id', () {
      final event = LoadWatchlistStatus(1);
      expect(event.props, [1]);
    });

    test('LoadWatchlistStatus should support value equality', () {
      expect(LoadWatchlistStatus(1), LoadWatchlistStatus(1));
    });
  });

  group(
    "loaded watchlist status",
    () {
      int id = 1;

      blocTest<WatchlistBloc, WatchlistState>(
        "test load watchlist status",
        build: () {
          when(mockGetWatchListStatus.execute(id))
              .thenAnswer((_) async => true);
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(LoadWatchlistStatus(id)),
        expect: () => [
          WatchlistLoaded(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchListStatus.execute(id));
        },
      );
    },
  );

  group(
    "save to watchlist",
    () {
      blocTest<WatchlistBloc, WatchlistState>(
        "test save to watchlist",
        build: () {
          when(mockSaveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Right('Added to Watchlist'));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(AddToWatchlist(testMovieDetail)),
        expect: () => [
          WatchlistUpdated(true, 'Added to Watchlist'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlist.execute(testMovieDetail));
        },
      );

      blocTest<WatchlistBloc, WatchlistState>(
        "fail save to watchlist",
        build: () {
          when(mockSaveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Left(DatabaseFailure("failure")));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(AddToWatchlist(testMovieDetail)),
        expect: () => [
          WatchlistError("failure"),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlist.execute(testMovieDetail));
        },
      );
    },
  );

  group(
    "Remove from watchlist",
    () {
      blocTest<WatchlistBloc, WatchlistState>(
        "success remove from watchlist",
        build: () {
          when(mockRemoveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Right('Removed from Watchlist'));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveFromWatchlist(testMovieDetail)),
        expect: () => [
          WatchlistUpdated(false, 'Removed from Watchlist'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlist.execute(testMovieDetail));
        },
      );

      blocTest<WatchlistBloc, WatchlistState>(
        "failed remove from watchlist",
        build: () {
          when(mockRemoveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Left(DatabaseFailure("failure")));
          return watchlistBloc;
        },
        act: (bloc) => bloc.add(RemoveFromWatchlist(testMovieDetail)),
        expect: () => [
          WatchlistError("failure"),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlist.execute(testMovieDetail));
        },
      );
    },
  );
}
