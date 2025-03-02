import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:ditonton/presentation/bloc/tv_show/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'top_rated_tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvShowTopRated,
])
void main() {
  late TopRatedTvBloc topRatedTvBloc;
  late MockGetTvShowTopRated mockGetTvShowTopRated;

  setUp(
    () {
      mockGetTvShowTopRated = MockGetTvShowTopRated();
      topRatedTvBloc = TopRatedTvBloc(mockGetTvShowTopRated);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(topRatedTvBloc.state, TopRatedTvEmpty());
    },
  );

  group(
    "loaded data for top rated tv show",
    () {
      blocTest<TopRatedTvBloc, TopRatedTvState>(
        "success load data",
        build: () {
          when(mockGetTvShowTopRated.executeProcess()).thenAnswer(
            (_) async => Right(tvListModel),
          );

          return topRatedTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRatedTv()),
        expect: () => [
          TopRatedTvLoading(),
          TopRatedTvHasData(tvListModel),
        ],
        verify: (bloc) {
          verify(mockGetTvShowTopRated.executeProcess());
        },
      );

      blocTest<TopRatedTvBloc, TopRatedTvState>(
        "Failed load Data server error",
        build: () {
          when(mockGetTvShowTopRated.executeProcess())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return topRatedTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRatedTv()),
        expect: () => [
          TopRatedTvLoading(),
          TopRatedTvError(''),
        ],
        verify: (bloc) {
          verify(mockGetTvShowTopRated.executeProcess());
        },
      );

      blocTest<TopRatedTvBloc, TopRatedTvState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetTvShowTopRated.executeProcess())
              .thenAnswer((_) async => Left(
                    ConnectionFailure('Failed to connect to the network'),
                  ));

          return topRatedTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadTopRatedTv()),
        expect: () => [
          TopRatedTvLoading(),
          TopRatedTvError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetTvShowTopRated.executeProcess());
        },
      );
    },
  );
}
