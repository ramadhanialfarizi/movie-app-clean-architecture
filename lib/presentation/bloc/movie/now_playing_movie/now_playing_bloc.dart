import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingBloc(this.getNowPlayingMovies) : super(NowPlayingEmpty()) {
    on<OnLoadNowPlaying>(
      (event, emit) async {
        emit(NowPlayingLoading());

        final result = await getNowPlayingMovies.execute();

        result.fold(
          (failure) {
            emit(NowPlayingError(failure.message));
          },
          (data) {
            emit(NowPlayingHasData(data));
          },
        );
      },
    );
  }
}
