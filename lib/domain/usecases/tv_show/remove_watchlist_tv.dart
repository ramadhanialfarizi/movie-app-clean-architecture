import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class RemoveWatchlistTv {
  final TvRepository repository;

  RemoveWatchlistTv({required this.repository});

  Future<Either<Failure, String>> execute(TvDetailResponse data) {
    return repository.removeWatchlist(data);
  }
}
