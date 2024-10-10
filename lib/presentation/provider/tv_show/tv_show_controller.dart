import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:flutter/material.dart';

class TvShowController extends ChangeNotifier {
  TvOnAirListResponse? tvOnAirListResponse;
  TvPopularListResponse? tvPopularListResponse;
  TvTopRatedListResponse? tvTopRatedListResponse;

  RequestState? tvOnAirState;
  RequestState? tvPopularState;
  RequestState? tvTopRatedState;

  final GetTvShowOnAir getTvShowOnAir;
  final GetTvShowPopular getTvShowPopular;
  final GetTvShowTopRated getTvShowTopRated;

  String message = "";

  TvShowController({
    required this.getTvShowOnAir,
    required this.getTvShowPopular,
    required this.getTvShowTopRated,
  });

  loadTVShowOnAir() async {
    tvOnAirState = RequestState.Loading;
    notifyListeners();

    var result = await getTvShowOnAir.executeProcess();
    result.fold(
      (failure) {
        tvOnAirState = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (tvOnAirData) {
        tvOnAirState = RequestState.Loaded;
        tvOnAirListResponse = tvOnAirData;
        notifyListeners();
      },
    );
  }

  loadTvShowPopular() async {
    tvPopularState = RequestState.Loading;
    notifyListeners();

    var result = await getTvShowPopular.executeProcess();

    result.fold(
      (failure) {
        tvPopularState = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (tvPopularList) {
        tvPopularState = RequestState.Loaded;
        tvPopularListResponse = tvPopularList;
        notifyListeners();
      },
    );
  }

  loadTvShowTopRated() async {
    tvTopRatedState = RequestState.Loading;
    notifyListeners();

    var result = await getTvShowTopRated.executeProcess();

    result.fold(
      (failure) {
        tvTopRatedState = RequestState.Error;
        message = failure.message;
        notifyListeners();
      },
      (tvTopRatedList) {
        tvTopRatedState = RequestState.Loaded;
        tvTopRatedListResponse = tvTopRatedList;
        notifyListeners();
      },
    );
  }
}
