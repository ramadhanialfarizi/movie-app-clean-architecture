import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchlistTv {
  final TvRepository _tvRepository;

  GetWatchlistTv(this._tvRepository);

  Future<Either<Failure, List<TvDetailResponse>>> execute() {
    return _tvRepository.getWatchlistTvShow();
  }
}
