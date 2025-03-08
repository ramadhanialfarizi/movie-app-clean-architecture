import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:ditonton/presentation/bloc/tv_show/detail_tv/load_detail_tv/load_detail_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'load_detail_tv_bloc.mocks.dart';

@GenerateMocks([
  GetTvShowDetail,
  GetTvShowRecomendation,
])
void main() {
  late LoadDetailTvBloc loadDetailTvBloc;
  late MockGetTvShowDetail mockGetTvShowDetail;
  late MockGetTvShowRecomendation mockGetTvShowRecomendation;

  setUp(
    () {
      mockGetTvShowDetail = MockGetTvShowDetail();
      mockGetTvShowRecomendation = MockGetTvShowRecomendation();
      loadDetailTvBloc = LoadDetailTvBloc(
        mockGetTvShowRecomendation,
        mockGetTvShowDetail,
      );
    },
  );

  test(
    "initial data shoul empty",
    () {
      expect(loadDetailTvBloc.state, LoadDetailTvEmpty());
    },
  );

  group(
    "test bloc",
    () {
      int id = 1;
      blocTest<LoadDetailTvBloc, LoadDetailTvState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockGetTvShowDetail.executeProcess(id))
              .thenAnswer((_) async => Right(tvDetailModel));

          when(mockGetTvShowRecomendation.executeProcess(id)).thenAnswer(
            (_) async => Right(tvListModel),
          );
          return loadDetailTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadDetailTv(id)),
        expect: () => [
          LoadDetailTvLoading(),
          LoadDetailTvHasData(
            tvDetail: tvDetailModel,
            tvRecomendation: tvListModel,
          ),
        ],
        verify: (bloc) {
          verify(mockGetTvShowDetail.executeProcess(id));
          verify(mockGetTvShowRecomendation.executeProcess(id));
        },
      );

      blocTest<LoadDetailTvBloc, LoadDetailTvState>(
        "Should emit [Loading, Error] when get search is unsuccessful",
        build: () {
          when(mockGetTvShowDetail.executeProcess(id))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

          when(mockGetTvShowRecomendation.executeProcess(id)).thenAnswer(
            (_) async => Left(ServerFailure('Server Failure')),
          );
          return loadDetailTvBloc;
        },
        act: (bloc) => bloc.add(OnLoadDetailTv(id)),
        expect: () => [
          LoadDetailTvLoading(),
          LoadDetailTvError('Server Failure'),
        ],
        verify: (bloc) {
          verify(mockGetTvShowDetail.executeProcess(id));
          verify(mockGetTvShowRecomendation.executeProcess(id));
        },
      );
    },
  );
}
