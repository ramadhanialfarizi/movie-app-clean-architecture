import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:flutter/material.dart';

class TvTopRatedController extends ChangeNotifier {
  RequestState? state;

  TvListModel? tvTopRated;

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
