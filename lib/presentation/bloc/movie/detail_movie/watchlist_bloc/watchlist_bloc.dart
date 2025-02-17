import 'package:ditonton/common/utils.dart';
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

        emit(WatchlistUpdated(isInWatchlist, "xxxx"));
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
            LogUtility.writeLog("add message: ${statusMessage}");
            emit(WatchlistUpdated(true, statusMessage));
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
            LogUtility.writeLog("remove message: ${statusMessage}");
            emit(WatchlistUpdated(false, statusMessage));
          },
        );
      },
    );
  }
}
