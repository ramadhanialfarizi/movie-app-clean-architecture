import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTvBloc extends Bloc<SearchTvEvent, SearchTvState> {
  final SearchTvShow searchTvShow;

  SearchTvBloc(this.searchTvShow) : super(SearchTvEmpty()) {
    on<OnQuerySearchTv>(
      (event, emit) async {
        final query = event.query;

        emit(SearchTvLoading());
        final result = await searchTvShow.executeProcess(query);

        result.fold(
          (failure) {
            emit(SearchTvError(failure.message));
          },
          (result) {
            emit(SearchTvHasData(result));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
