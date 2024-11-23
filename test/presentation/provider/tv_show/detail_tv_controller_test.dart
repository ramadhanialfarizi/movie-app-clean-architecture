import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_show/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_show/save_watchlist_tv.dart';
import 'package:ditonton/presentation/provider/tv_show/detail_tv_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'detail_tv_controller_test.mocks.dart';

@GenerateMocks([
  GetTvShowDetail,
  GetTvShowRecomendation,
  GetWatchlistTvStatus,
  SaveWatchlistTv,
  RemoveWatchlistTv,
])
void main() {
  late DetailTvController controller;
  late MockGetTvShowDetail mockTvShowDetail;
  late MockGetTvShowRecomendation mockGetTvShowRecomendation;
  late MockGetWatchlistTvStatus mockGetWatchlistTvStatus;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;

  int id = 1111;

  setUp(
    () {
      mockRemoveWatchlistTv = MockRemoveWatchlistTv();
      mockSaveWatchlistTv = MockSaveWatchlistTv();
      mockGetWatchlistTvStatus = MockGetWatchlistTvStatus();
      mockGetTvShowRecomendation = MockGetTvShowRecomendation();
      mockTvShowDetail = MockGetTvShowDetail();
      controller = DetailTvController(
        tvShowDetail: mockTvShowDetail,
        recomendationTvShow: mockGetTvShowRecomendation,
        getWatchlistTvStatus: mockGetWatchlistTvStatus,
        saveWatchlist: mockSaveWatchlistTv,
        removeWatchlist: mockRemoveWatchlistTv,
      );
    },
  );

  void _executeUseCase() {
    when(mockTvShowDetail.executeProcess(id))
        .thenAnswer((_) async => Right(tvDummyDetail));

    when(mockGetTvShowRecomendation.executeProcess(id))
        .thenAnswer((_) async => Right(tvRecomendationListResponse));
  }

  void _executeFailedRecomendation() {
    when(mockTvShowDetail.executeProcess(id))
        .thenAnswer((_) async => Right(tvDummyDetail));

    when(mockGetTvShowRecomendation.executeProcess(id))
        .thenAnswer((_) async => Left(ServerFailure('Failed')));
  }

  group(
    "get tv show detail",
    () {
      test(
        'should get data from the usecase',
        () async {
          _executeUseCase();

          await controller.getDetailData(id);
          verify(mockTvShowDetail.executeProcess(id));
          verify(mockGetTvShowRecomendation.executeProcess(id));
        },
      );

      test('should change state to Loading when usecase is called', () {
        // arrange
        _executeUseCase();
        // act
        controller.getDetailData(id);
        // assert
        expect(controller.detailState, RequestState.Loading);
      });

      test('should change movie when data is gotten successfully', () async {
        // arrange
        _executeUseCase();
        // act
        await controller.getDetailData(id);
        // assert
        expect(controller.detailState, RequestState.Loaded);
        expect(controller.tvDetailResponse, tvDummyDetail);
      });

      test(
          'should change recommendation tv show when data is gotten successfully',
          () async {
        // arrange
        _executeUseCase();
        // act
        await controller.getDetailData(id);
        await controller.getRecomendationTV(id);
        // assert
        expect(controller.detailState, RequestState.Loaded);
        expect(controller.tvRecomendationListResponse,
            tvRecomendationListResponse);
      });
    },
  );

  group(
    "get tv recomendation",
    () {
      test('should get data from the usecase', () async {
        // arrange
        _executeUseCase();
        // act
        await controller.getDetailData(id);
        await controller.getRecomendationTV(id);
        // assert
        verify(mockGetTvShowRecomendation.executeProcess(id));
        expect(controller.tvRecomendationListResponse,
            tvRecomendationListResponse);
      });

      test(
          'should update recommendation state when data is gotten successfully',
          () async {
        // arrange
        _executeUseCase();
        // act
        await controller.getDetailData(id);
        await controller.getRecomendationTV(id);
        // assert
        expect(controller.recomendationState, RequestState.Loaded);
        expect(controller.tvRecomendationListResponse,
            tvRecomendationListResponse);
      });

      test('should update error message when request in successful', () async {
        // arrange
        _executeFailedRecomendation();
        // act
        await controller.getDetailData(id);
        await controller.getRecomendationTV(id);
        // assert
        expect(controller.recomendationState, RequestState.Error);
        expect(controller.message, 'Failed');
      });
    },
  );

  group(
    "watchlist tv show",
    () {
      test(
        "get watchlist status",
        () async {
          when(mockGetWatchlistTvStatus.execute(id))
              .thenAnswer((_) async => true);

          await controller.loadWatchlistStatus(id);

          expect(controller.isAddedWatchlist, true);
        },
      );

      test('should execute save watchlist when function called', () async {
        // arrange
        when(mockSaveWatchlistTv.execute(tvDummyDetail))
            .thenAnswer((_) async => Right('Success'));
        when(mockGetWatchlistTvStatus.execute(tvDummyDetail.id))
            .thenAnswer((_) async => true);
        // act
        await controller.addWatchlist(tvDummyDetail);
        // assert
        verify(mockSaveWatchlistTv.execute(tvDummyDetail));
      });

      test('should execute remove watchlist when function called', () async {
        // arrange
        when(mockRemoveWatchlistTv.execute(tvDummyDetail))
            .thenAnswer((_) async => Right('Removed'));
        when(mockGetWatchlistTvStatus.execute(tvDummyDetail.id))
            .thenAnswer((_) async => false);

        // act
        await controller.removeFromWatchlist(tvDummyDetail);
        // assert
        verify(mockRemoveWatchlistTv.execute(tvDummyDetail));
      });

      test('should update watchlist status when add watchlist success',
          () async {
        // arrange
        when(mockSaveWatchlistTv.execute(tvDummyDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        when(mockGetWatchlistTvStatus.execute(tvDummyDetail.id))
            .thenAnswer((_) async => true);
        // act
        await controller.addWatchlist(tvDummyDetail);
        // assert
        verify(mockGetWatchlistTvStatus.execute(tvDummyDetail.id));
        expect(controller.isAddedWatchlist, true);
        expect(controller.watchlistMessage, 'Added to Watchlist');
      });

      test('should update watchlist message when add watchlist failed',
          () async {
        // arrange
        when(mockSaveWatchlistTv.execute(tvDummyDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
        when(mockGetWatchlistTvStatus.execute(tvDummyDetail.id))
            .thenAnswer((_) async => false);
        // act
        await controller.addWatchlist(tvDummyDetail);
        // assert
        expect(controller.watchlistMessage, 'Failed');
      });
    },
  );
}
