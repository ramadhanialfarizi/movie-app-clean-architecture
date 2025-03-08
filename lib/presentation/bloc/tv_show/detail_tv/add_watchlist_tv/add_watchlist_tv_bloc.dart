import 'package:ditonton/domain/entities/tv_entities/tv_detail_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv_show/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv_show/save_watchlist_tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_watchlist_tv_event.dart';
part 'add_watchlist_tv_state.dart';

class AddWatchlistTvBloc
    extends Bloc<AddWatchlistTvEvent, AddWatchlistTvState> {
  final GetWatchlistTvStatus getWatchlistTvStatus;
  final SaveWatchlistTv saveWatchlist;
  final RemoveWatchlistTv removeWatchlist;

  AddWatchlistTvBloc(
      this.getWatchlistTvStatus, this.removeWatchlist, this.saveWatchlist)
      : super(AddWatchlistTvInitial()) {
    on<LoadWatchlistTvStatus>(
      (event, emit) async {
        final id = event.id;
        final watchlistStatus = await getWatchlistTvStatus.execute(id);

        emit(AddWatchlistTvLoaded(watchlistStatus));
      },
    );

    on<AddWatchlistTv>(
      (event, emit) async {
        var data = event.tvData;

        final addWatchlist = await saveWatchlist.execute(data);

        addWatchlist.fold(
          (failure) {
            emit(AddWatchlistTvError(failure.message));
          },
          (message) {
            emit(AddWatchlistTvUpdated(true, message));
          },
        );
      },
    );

    on<RemoveFromWatchlistTv>(
      (event, emit) async {
        final data = event.tvData;
        final removeWatchlistTv = await removeWatchlist.execute(data);

        removeWatchlistTv.fold(
          (failure) {
            emit(AddWatchlistTvError(failure.message));
          },
          (message) {
            emit(AddWatchlistTvUpdated(false, message));
          },
        );
      },
    );
  }
}
