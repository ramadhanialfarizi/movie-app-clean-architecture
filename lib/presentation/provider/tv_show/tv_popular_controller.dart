import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:flutter/material.dart';

class TvPopularController extends ChangeNotifier {
  RequestState? popularState;
  TvPopularListResponse? tvPopularListResponse;

  final GetTvShowPopular getTvShowPopular;
  String message = "";

  TvPopularController({
    required this.getTvShowPopular,
  });

  loadTvPopularData() async {
    popularState = RequestState.Loading;
    notifyListeners();

    var result = await getTvShowPopular.executeProcess();
    result.fold(
      (failure) {
        popularState = RequestState.Error;
        message = failure.message;
      },
      (data) {
        popularState = RequestState.Loaded;
        tvPopularListResponse = data;
        notifyListeners();
      },
    );
  }
}
