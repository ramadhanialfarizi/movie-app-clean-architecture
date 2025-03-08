part of 'load_detail_tv_bloc.dart';

abstract class LoadDetailTvEvent extends Equatable {
  const LoadDetailTvEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDetailTv extends LoadDetailTvEvent {
  final int id;

  OnLoadDetailTv(this.id);

  @override
  List<Object> get props => [id];
}
