import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  DetailMovieBloc(
    this._getMovieDetail,
    this._getMovieRecommendations,
    this.saveWatchlist,
    this.getWatchListStatus,
    this.removeWatchlist,
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
              emit(DetailMovieHasData(detailData, recomendedData));
            },
          );
        },
      );
    });
    // on<LoadWatchlistStatus>(loadWatchlistStatus);
    // on<AddToWatchlist>(onAddWatchlist);
    // on<RemoveFromWatchlist>(onRemoveWatchlist);
  }

  // Future<void> loadDetailMovieData(
  //     OnLoadDetailMovie event, Emitter<DetailMovieState> emit) async {
  //   final id = event.id;

  //   emit(DetailMovieLoading());
  //   final resultDetail = await _getMovieDetail.execute(id);
  //   final resultRecomended = await _getMovieRecommendations.execute(id);

  //   resultDetail.fold(
  //     (failure) {
  //       emit(DetailMovieError(failure.message));
  //     },
  //     (detailData) {
  //       resultRecomended.fold(
  //         (failure) {
  //           emit(DetailMovieError(failure.message));
  //         },
  //         (recomendedData) {
  //           emit(DetailMovieHasData(detailData, recomendedData));
  //         },
  //       );
  //     },
  //   );
  // }

//   Future<void> loadWatchlistStatus(
//       LoadWatchlistStatus event, Emitter<DetailMovieState> emit) async {
//     final isInWatchlist = await getWatchListStatus.execute(event.id);
//     emit(WatchlistUpdated(isInWatchlist, ""));
//   }

//   Future<void> onAddWatchlist(
//       AddToWatchlist event, Emitter<DetailMovieState> emit) async {
//     final addWatchlistMoview = await saveWatchlist.execute(event.movie);

//     addWatchlistMoview.fold(
//       (failure) {
//         emit(WatchlistError(failure.message));
//       },
//       (status) {
//         emit(WatchlistUpdated(true, status));
//         add(LoadWatchlistStatus(event.movie.id));
//       },
//     );
//   }

//   Future<void> onRemoveWatchlist(
//       RemoveFromWatchlist event, Emitter<DetailMovieState> emit) async {
//     final removeWatchlistMovie = await removeWatchlist.execute(event.movie);

//     removeWatchlistMovie.fold(
//       (failure) {
//         emit(WatchlistError(failure.message));
//       },
//       (status) {
//         emit(WatchlistUpdated(true, status));
//         add(LoadWatchlistStatus(event.movie.id));
//       },
//     );
//   }
}
