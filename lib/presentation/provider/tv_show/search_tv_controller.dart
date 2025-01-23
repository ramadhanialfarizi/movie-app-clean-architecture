import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:flutter/material.dart';

class SearchTvController extends ChangeNotifier {
  RequestState? state;
  TvListModel? tvListModel;

  String message = '';

  final SearchTvShow searchTvShow;

  SearchTvController({
    required this.searchTvShow,
  });

  searchData(String query) async {
    state = RequestState.Loading;
    notifyListeners();

    var result = await searchTvShow.executeProcess(query);
    result.fold(
      (failure) {
        message = failure.message;
        state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        tvListModel = data;
        state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  resetStateData() {
    state = RequestState.Empty;
    notifyListeners();
  }
}
