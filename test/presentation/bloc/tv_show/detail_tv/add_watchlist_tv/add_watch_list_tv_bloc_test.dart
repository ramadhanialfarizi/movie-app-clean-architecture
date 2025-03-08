import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_show/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_show/save_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tv_show/detail_tv/add_watchlist_tv/add_watchlist_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'add_watch_list_tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchlistTvStatus,
  SaveWatchlistTv,
  RemoveWatchlistTv,
])
void main() {
  late AddWatchlistTvBloc addWatchlistTvBloc;
  late MockGetWatchlistTvStatus mockGetWatchlistTvStatus;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;

  setUp(
    () {
      mockGetWatchlistTvStatus = MockGetWatchlistTvStatus();
      mockRemoveWatchlistTv = MockRemoveWatchlistTv();
      mockSaveWatchlistTv = MockSaveWatchlistTv();
      addWatchlistTvBloc = AddWatchlistTvBloc(
        mockGetWatchlistTvStatus,
        mockRemoveWatchlistTv,
        mockSaveWatchlistTv,
      );
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(addWatchlistTvBloc.state, AddWatchlistTvInitial());
    },
  );

  group(
    "loaded watchlist status",
    () {
      int id = 1;
      blocTest(
        "test load watchlist status success",
        build: () {
          when(mockGetWatchlistTvStatus.execute(id))
              .thenAnswer((_) async => true);

          return addWatchlistTvBloc;
        },
        act: (bloc) => bloc.add(LoadWatchlistTvStatus(id)),
        expect: () => [
          AddWatchlistTvLoaded(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTvStatus.execute(id));
        },
      );
    },
  );

  group(
    "save to watchlist",
    () {
      blocTest<AddWatchlistTvBloc, AddWatchlistTvState>(
        "test save to watchlist",
        build: () {
          when(mockSaveWatchlistTv.execute(tvDetailModel))
              .thenAnswer((_) async => Right('Added to Watchlist'));
          return addWatchlistTvBloc;
        },
        act: (bloc) => bloc.add(AddWatchlistTv(tvDetailModel)),
        expect: () => [
          AddWatchlistTvUpdated(true, 'Added to Watchlist'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTv.execute(tvDetailModel));
        },
      );

      blocTest<AddWatchlistTvBloc, AddWatchlistTvState>(
        "fail save to watchlist",
        build: () {
          when(mockSaveWatchlistTv.execute(tvDetailModel))
              .thenAnswer((_) async => Left(DatabaseFailure("failure")));
          return addWatchlistTvBloc;
        },
        act: (bloc) => bloc.add(AddWatchlistTv(tvDetailModel)),
        expect: () => [
          AddWatchlistTvError("failure"),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTv.execute(tvDetailModel));
        },
      );
    },
  );

  group(
    "Remove from watchlist",
    () {
      blocTest<AddWatchlistTvBloc, AddWatchlistTvState>(
        "success remove from watchlist",
        build: () {
          when(mockRemoveWatchlistTv.execute(tvDetailModel))
              .thenAnswer((_) async => Right('Removed from Watchlist'));
          return addWatchlistTvBloc;
        },
        act: (bloc) => bloc.add(RemoveFromWatchlistTv(tvDetailModel)),
        expect: () => [
          AddWatchlistTvUpdated(false, 'Removed from Watchlist'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTv.execute(tvDetailModel));
        },
      );

      blocTest<AddWatchlistTvBloc, AddWatchlistTvState>(
        "failed remove from watchlist",
        build: () {
          when(mockRemoveWatchlistTv.execute(tvDetailModel))
              .thenAnswer((_) async => Left(DatabaseFailure("failure")));
          return addWatchlistTvBloc;
        },
        act: (bloc) => bloc.add(RemoveFromWatchlistTv(tvDetailModel)),
        expect: () => [
          AddWatchlistTvError("failure"),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTv.execute(tvDetailModel));
        },
      );
    },
  );
}
