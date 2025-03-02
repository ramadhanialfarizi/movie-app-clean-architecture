import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:ditonton/presentation/bloc/tv_show/popular_tv/popular_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'popular_tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvShowPopular,
])
void main() {
  late PopularTvBloc popularTvBloc;
  late MockGetTvShowPopular mockGetTvShowPopular;

  setUp(
    () {
      mockGetTvShowPopular = MockGetTvShowPopular();
      popularTvBloc = PopularTvBloc(mockGetTvShowPopular);
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(popularTvBloc.state, PopularTvEmpty());
    },
  );

  group(
    "loaded data for popular tv show",
    () {
      blocTest<PopularTvBloc, PopularTvState>(
        "success load data",
        build: () {
          when(mockGetTvShowPopular.executeProcess()).thenAnswer(
            (_) async => Right(tvListModel),
          );

          return popularTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularTv()),
        expect: () => [
          PopularTvLoading(),
          PopularTvHasData(tvListModel),
        ],
        verify: (bloc) {
          verify(mockGetTvShowPopular.executeProcess());
        },
      );

      blocTest<PopularTvBloc, PopularTvState>(
        "Failed load Data server error",
        build: () {
          when(mockGetTvShowPopular.executeProcess())
              .thenAnswer((_) async => Left(ServerFailure('')));

          return popularTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularTv()),
        expect: () => [
          PopularTvLoading(),
          PopularTvError(''),
        ],
        verify: (bloc) {
          verify(mockGetTvShowPopular.executeProcess());
        },
      );

      blocTest<PopularTvBloc, PopularTvState>(
        "Failed load Data connection failed",
        build: () {
          when(mockGetTvShowPopular.executeProcess())
              .thenAnswer((_) async => Left(
                    ConnectionFailure('Failed to connect to the network'),
                  ));

          return popularTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadPopularTv()),
        expect: () => [
          PopularTvLoading(),
          PopularTvError('Failed to connect to the network'),
        ],
        verify: (bloc) {
          verify(mockGetTvShowPopular.executeProcess());
        },
      );
    },
  );
}
