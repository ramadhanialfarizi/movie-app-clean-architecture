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
        state = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (data) {
        state = RequestState.Loaded;
        resultData = data;
        notifyListeners();
      },
    );
  }

  resetStateData() {
    state = RequestState.Empty;
    notifyListeners();
  }
}
