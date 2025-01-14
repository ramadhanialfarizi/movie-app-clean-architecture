import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_entities/detail/tv_detail_model.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SaveWatchlistTv {
  final TvRepository repository;

  SaveWatchlistTv({required this.repository});

  Future<Either<Failure, String>> execute(TvDetailModel data) {
    return repository.saveWatchlist(data);
  }
}
