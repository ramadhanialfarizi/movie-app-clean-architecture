import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:flutter/material.dart';

class DetailTvController extends ChangeNotifier {
  RequestState? detailState;
  RequestState? recomendationState;
  TvDetailResponse? tvDetailResponse;

  String message = '';

  final GetTvShowDetail tvShowDetail;

  DetailTvController({
    required this.tvShowDetail,
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
      },
    );
  }
}
