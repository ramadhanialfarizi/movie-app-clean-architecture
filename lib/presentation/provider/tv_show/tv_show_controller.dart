import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_data_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:flutter/material.dart';

class TvShowController extends ChangeNotifier {
  TvPopularListResponse? tvPopularListResponse;
  TvOnAirDataResponse? tvOnAirDataResponse;
  TvTopRatedListResponse? tvTopRatedListResponse;

  RequestState? tvPopularState;
  RequestState? tvOnAirState;
  RequestState? tvTopRatedState;

  TvShowController() {}

  getTVShowPopular() async {}
}
