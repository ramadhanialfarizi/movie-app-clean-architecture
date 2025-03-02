import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_top_rated.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTvShowTopRated getTvTopRated;

  TopRatedTvBloc(this.getTvTopRated) : super(TopRatedTvEmpty()) {
    on<OnLoadTopRatedTv>(
      (event, emit) async {
        emit(TopRatedTvLoading());

        final result = await getTvTopRated.executeProcess();

        result.fold(
          (failure) {
            emit(TopRatedTvError(failure.message));
          },
          (data) {
            emit(TopRatedTvHasData(data));
          },
        );
      },
    );
  }
}
