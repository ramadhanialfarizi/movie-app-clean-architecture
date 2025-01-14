import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_entities/detail/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';

import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_show/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_show/save_watchlist_tv.dart';
import 'package:flutter/material.dart';

class DetailTvController extends ChangeNotifier {
  RequestState? detailState;
  RequestState? recomendationState;

  TvDetailModel? tvDetailResponse;
  TvListModel? tvRecomendationListResponse;

  String message = '';

  final GetTvShowDetail tvShowDetail;
  final GetTvShowRecomendation recomendationTvShow;

  // for handle watchlist
  // final GetWatchListStatus getWatchListStatus;
  final GetWatchlistTvStatus getWatchlistTvStatus;
  final SaveWatchlistTv saveWatchlist;
  final RemoveWatchlistTv removeWatchlist;
  bool isAddedWatchlist = false;

  DetailTvController({
    required this.tvShowDetail,
    required this.recomendationTvShow,
    required this.getWatchlistTvStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  });

  getDetailData(int id) async {
    detailState = RequestState.Loading;
    notifyListeners();

    var result = await tvShowDetail.executeProcess(id);
    result.fold(
      (failure) {
        detailState = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (data) {
        detailState = RequestState.Loaded;
        tvDetailResponse = data;
        notifyListeners();

        getRecomendationTV(id);
      },
    );
  }

  getRecomendationTV(int id) async {
    recomendationState = RequestState.Loading;
    notifyListeners();

    var result = await recomendationTvShow.executeProcess(id);
    result.fold(
      (failure) {
        recomendationState = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (data) {
        recomendationState = RequestState.Loaded;
        tvRecomendationListResponse = data;
        notifyListeners();
      },
    );
  }

  // Watchlist handle
  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  Future<void> addWatchlist(TvDetailModel data) async {
    final result = await saveWatchlist.execute(data);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(data.id ?? 0);
  }

  Future<void> removeFromWatchlist(TvDetailModel data) async {
    final result = await removeWatchlist.execute(data);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(data.id ?? 0);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchlistTvStatus.execute(id);
    isAddedWatchlist = result;
    notifyListeners();
  }
}
