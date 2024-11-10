import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:flutter/material.dart';

class SearchTvController extends ChangeNotifier {
  RequestState? state;
  SearchTvListResponse? resultData;

  // TextEditingController textController = TextEditingController();

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
        resultData = data;
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
