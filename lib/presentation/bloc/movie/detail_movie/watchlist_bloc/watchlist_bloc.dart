import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  WatchlistBloc(
    this.getWatchListStatus,
    this.saveWatchlist,
    this.removeWatchlist,
  ) : super(WatchlistInitial()) {
    on<LoadWatchlistStatus>(
      (event, emit) async {
        final isInWatchlist = await getWatchListStatus.execute(event.id);

        emit(WatchlistUpdated(isInWatchlist, ""));
      },
    );

    on<AddToWatchlist>(
      (event, emit) async {
        final addWatchlistMoview = await saveWatchlist.execute(event.movie);

        addWatchlistMoview.fold(
          (failure) {
            emit(WatchlistError(failure.message));
          },
          (statusMessage) {
            emit(WatchlistUpdated(true, statusMessage));
            // add(LoadWatchlistStatus(event.movie.id));
          },
        );
      },
    );

    on<RemoveFromWatchlist>(
      (event, emit) async {
        final removeWatchlistMovie = await removeWatchlist.execute(event.movie);

        removeWatchlistMovie.fold(
          (failure) {
            emit(WatchlistError(failure.message));
          },
          (statusMessage) {
            emit(WatchlistUpdated(false, statusMessage));
            // add(LoadWatchlistStatus(event.movie.id));
          },
        );
      },
    );
  }
}
