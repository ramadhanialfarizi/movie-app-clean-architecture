import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:flutter/foundation.dart';

class TvNowPlayingController extends ChangeNotifier {
  RequestState? state;
  TvOnAirListResponse? tvOnAirListResponse;
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
