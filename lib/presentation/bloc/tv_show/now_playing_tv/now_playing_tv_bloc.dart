import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'now_playing_tv_event.dart';
part 'now_playing_tv_state.dart';

class NowPlayingTvBloc extends Bloc<NowPlayingTvEvent, NowPlayingTvState> {
  final GetTvShowOnAir getTvShowOnAir;

  NowPlayingTvBloc(this.getTvShowOnAir) : super(NowPlayingTvEmpty()) {
    on<OnLoadNowPlayingTv>(
      (event, emit) async {
        emit(NowPlayingTvLoading());

        var result = await getTvShowOnAir.executeProcess();
        result.fold(
          (failure) {
            emit(NowPlayingTvError(failure.message));
          },
          (data) {
            emit(NowPlayingTvHasData(data));
          },
        );
      },
    );
  }
}
