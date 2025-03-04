import 'package:ditonton/domain/entities/tv_entities/tv_watchlist_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_tv_event.dart';
part 'watchlist_tv_state.dart';

class WatchlistTvBloc extends Bloc<WatchlistTvEvent, WatchlistTvState> {
  final GetWatchlistTv getWatchlistTv;

  WatchlistTvBloc(this.getWatchlistTv) : super(WatchlistTvEmpty()) {
    on<OnloadWatchlistTv>(
      (event, emit) async {
        emit(WatchlistTvLoading());

        final result = await getWatchlistTv.execute();

        result.fold(
          (failure) {
            emit(WatchlistTvError(failure.message));
          },
          (tvData) {
            emit(WatchlistTvHasData(tvData));
          },
        );
      },
    );
  }
}
