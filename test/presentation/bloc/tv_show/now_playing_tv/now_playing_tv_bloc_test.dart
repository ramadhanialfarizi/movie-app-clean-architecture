import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:ditonton/presentation/bloc/tv_show/now_playing_tv/now_playing_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'now_playing_tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvShowOnAir,
])
void main() {
  late NowPlayingTvBloc nowPlayingTvBloc;
  late MockGetTvShowOnAir mockGetTvShowOnAir;

  setUp(
    () {
      mockGetTvShowOnAir = MockGetTvShowOnAir();
      nowPlayingTvBloc = NowPlayingTvBloc(mockGetTvShowOnAir);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(nowPlayingTvBloc.state, NowPlayingTvEmpty());
    },
  );

  group(
    "loaded data for now playing tv show",
    () {
      blocTest<NowPlayingTvBloc, NowPlayingTvState>(
        "success load data",
        build: () {
          when(mockGetTvShowOnAir.executeProcess()).thenAnswer(
            (_) async => Right(tvListModel),
          );

          return nowPlayingTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlayingTv()),
        expect: () => [
          NowPlayingTvLoading(),
          NowPlayingTvHasData(tvListModel),
        ],
        verify: (bloc) {
          verify(mockGetTvShowOnAir.executeProcess());
        },
      );

      blocTest<NowPlayingTvBloc, NowPlayingTvState>(
        "Failed load Data server error",
        build: () {
          when(mockGetTvShowOnAir.executeProcess())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return nowPlayingTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlayingTv()),
        expect: () => [
          NowPlayingTvLoading(),
          NowPlayingTvError(''),
        ],
        verify: (bloc) {
          verify(mockGetTvShowOnAir.executeProcess());
        },
      );

      blocTest<NowPlayingTvBloc, NowPlayingTvState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetTvShowOnAir.executeProcess())
              .thenAnswer((_) async => Left(
                    ConnectionFailure('Failed to connect to the network'),
                  ));

          return nowPlayingTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadNowPlayingTv()),
        expect: () => [
          NowPlayingTvLoading(),
          NowPlayingTvError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetTvShowOnAir.executeProcess());
        },
      );
    },
  );
}
