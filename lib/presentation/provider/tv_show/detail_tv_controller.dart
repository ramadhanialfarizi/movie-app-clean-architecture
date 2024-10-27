import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:flutter/material.dart';

class DetailTvController extends ChangeNotifier {
  RequestState? detailState;
  RequestState? recomendationState;

  TvDetailResponse? tvDetailResponse;
  TvRecomendationListResponse? tvRecomendationListResponse;

  String message = '';

  final GetTvShowDetail tvShowDetail;
  final GetTvShowRecomendation recomendationTvShow;

  DetailTvController({
    required this.tvShowDetail,
    required this.recomendationTvShow,
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
}
