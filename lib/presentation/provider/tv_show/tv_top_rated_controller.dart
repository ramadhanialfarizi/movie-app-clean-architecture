import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:flutter/material.dart';

class TvTopRatedController extends ChangeNotifier {
  RequestState? state;

  TvTopRatedListResponse? tvTopRated;

  final GetTvShowTopRated getTvTopRated;
  String message = "";

  TvTopRatedController({
    required this.getTvTopRated,
  });

  loadTvShowTopRated() async {
    state = RequestState.Loading;
    notifyListeners();

    var result = await getTvTopRated.executeProcess();

    result.fold(
      (failure) {
        state = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (tvTopRatedList) {
        state = RequestState.Loaded;
        tvTopRated = tvTopRatedList;
        notifyListeners();
      },
    );
  }
}
