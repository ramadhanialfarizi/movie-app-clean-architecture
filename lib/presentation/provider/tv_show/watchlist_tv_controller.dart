import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_watchlist_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv.dart';
import 'package:flutter/foundation.dart';

class WatchlistTvController extends ChangeNotifier {
  var _watchlistTV = <TvWatchlistModel>[];
  List<TvWatchlistModel> get watchlistTV => _watchlistTV;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  GetWatchlistTv getWatchlistTv;

  WatchlistTvController({required this.getWatchlistTv});

  Future<void> fetchWatchlistTV() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTV = tvData;
        notifyListeners();
      },
    );
  }
}
