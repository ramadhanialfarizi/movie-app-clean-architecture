part of 'load_detail_tv_bloc.dart';

abstract class LoadDetailTvState extends Equatable {
  const LoadDetailTvState();

  @override
  List<Object> get props => [];
}

class LoadDetailTvEmpty extends LoadDetailTvState {}

class LoadDetailTvLoading extends LoadDetailTvState {}

class LoadDetailTvError extends LoadDetailTvState {
  final String message;

  LoadDetailTvError(this.message);

  @override
  List<Object> get props => [message];
}

class LoadDetailTvHasData extends LoadDetailTvState {
  final TvDetailModel tvDetail;
  final TvListModel tvRecomendation;

  LoadDetailTvHasData({required this.tvDetail, required this.tvRecomendation});

  @override
  List<Object> get props => [tvDetail, tvRecomendation];
}
