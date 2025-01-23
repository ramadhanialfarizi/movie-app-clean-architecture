import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_detail_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class RemoveWatchlistTv {
  final TvRepository repository;

  RemoveWatchlistTv({required this.repository});

  Future<Either<Failure, String>> execute(TvDetailModel data) {
    return repository.removeWatchlist(data);
  }
}
