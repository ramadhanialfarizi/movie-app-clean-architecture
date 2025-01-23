import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:flutter/foundation.dart';

class TvNowPlayingController extends ChangeNotifier {
  RequestState? state;
  TvListModel? tvOnAirListResponse;
  String message = "";

  final GetTvShowOnAir getTvShowOnAir;

  TvNowPlayingController({required this.getTvShowOnAir});

  loadTVShowOnAir() async {
    state = RequestState.Loading;
    notifyListeners();

    var result = await getTvShowOnAir.executeProcess();
    result.fold(
      (failure) {
        state = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (tvOnAirData) {
        state = RequestState.Loaded;
        tvOnAirListResponse = tvOnAirData;
        notifyListeners();
      },
    );
  }
}
