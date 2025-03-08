import 'package:ditonton/domain/entities/tv_entities/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_detail_tv_event.dart';
part 'load_detail_tv_state.dart';

class LoadDetailTvBloc extends Bloc<LoadDetailTvEvent, LoadDetailTvState> {
  final GetTvShowDetail tvShowDetail;
  final GetTvShowRecomendation recomendationTvShow;

  LoadDetailTvBloc(this.recomendationTvShow, this.tvShowDetail)
      : super(LoadDetailTvEmpty()) {
    on<OnLoadDetailTv>(
      (event, emit) async {
        final id = event.id;

        emit(LoadDetailTvLoading());
        final detailResult = await tvShowDetail.executeProcess(id);
        final recomendationResult =
            await recomendationTvShow.executeProcess(id);

        detailResult.fold(
          (failure) {
            emit(LoadDetailTvError(failure.message));
          },
          (detail) {
            recomendationResult.fold(
              (failure) {
                emit(LoadDetailTvError(failure.message));
              },
              (recomendation) {
                emit(LoadDetailTvHasData(
                    tvDetail: detail, tvRecomendation: recomendation));
              },
            );
          },
        );
      },
    );
  }
}
