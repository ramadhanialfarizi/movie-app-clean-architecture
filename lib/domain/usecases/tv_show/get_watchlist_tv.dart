import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_watchlist_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchlistTv {
  final TvRepository _tvRepository;

  GetWatchlistTv(this._tvRepository);

  Future<Either<Failure, List<TvWatchlistModel>>> execute() {
    return _tvRepository.getWatchlistTvShow();
  }
}
