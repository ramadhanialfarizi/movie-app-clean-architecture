import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;

  DetailMovieBloc(
    this._getMovieDetail,
    this._getMovieRecommendations,
  ) : super(DetailMovieEmpty()) {
    on<OnLoadDetailMovie>((event, emit) async {
      final id = event.id;

      emit(DetailMovieLoading());
      final resultDetail = await _getMovieDetail.execute(id);
      final resultRecomended = await _getMovieRecommendations.execute(id);

      resultDetail.fold(
        (failure) {
          emit(DetailMovieError(failure.message));
        },
        (detailData) {
          resultRecomended.fold(
            (failure) {
              emit(DetailMovieError(failure.message));
            },
            (recomendedData) {
              emit(DetailMovieHasData(
                detailData,
                recomendedData,
              ));
            },
          );
        },
      );
    });
  }
}
