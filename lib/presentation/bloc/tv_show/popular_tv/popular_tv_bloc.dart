import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetTvShowPopular getTvShowPopular;

  PopularTvBloc(this.getTvShowPopular) : super(PopularTvEmpty()) {
    on<OnLoadPopularTv>(
      (event, emit) async {
        emit(PopularTvLoading());

        var result = await getTvShowPopular.executeProcess();
        result.fold(
          (failure) {
            emit(PopularTvError(failure.message));
          },
          (data) {
            emit(PopularTvHasData(data));
          },
        );
      },
    );
  }
}
