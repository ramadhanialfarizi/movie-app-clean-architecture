import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/load_detail_bloc/detail_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import 'detail_movie_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
])
void main() {
  late DetailMovieBloc detailMovieBloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;

  setUp(
    () {
      mockGetMovieDetail = MockGetMovieDetail();
      mockGetMovieRecommendations = MockGetMovieRecommendations();
      detailMovieBloc = DetailMovieBloc(
        mockGetMovieDetail,
        mockGetMovieRecommendations,
      );
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(detailMovieBloc.state, DetailMovieEmpty());
    },
  );

  group(
    "test bloc",
    () {
      int id = 1;
      blocTest<DetailMovieBloc, DetailMovieState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockGetMovieDetail.execute(id))
              .thenAnswer((_) async => Right(testMovieDetail));

          when(mockGetMovieRecommendations.execute(id)).thenAnswer(
            (_) async => Right(testMovieList),
          );
          return detailMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadDetailMovie(id)),
        expect: () => [
          DetailMovieLoading(),
          DetailMovieHasData(testMovieDetail, testMovieList),
        ],
        verify: (bloc) {
          verify(mockGetMovieDetail.execute(id));
          verify(mockGetMovieRecommendations.execute(id));
        },
      );

      blocTest<DetailMovieBloc, DetailMovieState>(
        "Should emit [Loading, Error] when get search is unsuccessful",
        build: () {
          when(mockGetMovieDetail.execute(id))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          when(mockGetMovieRecommendations.execute(id)).thenAnswer(
            (_) async => Right(testMovieList),
          );
          return detailMovieBloc;
        },
        act: (bloc) => bloc.add(OnLoadDetailMovie(id)),
        expect: () => [
          DetailMovieLoading(),
          DetailMovieError('Server Failure'),
        ],
        verify: (bloc) {
          verify(mockGetMovieDetail.execute(id));
          verify(mockGetMovieRecommendations.execute(id));
        },
      );
    },
  );
}
