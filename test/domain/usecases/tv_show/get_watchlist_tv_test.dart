import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_watchlist_model.dart';
import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchlistTv(mockTvRepository);
  });

  final tTvWatchlist = [
    TvWatchlistModel(
      id: 1,
      title: 'Test TV Show',
      overview: 'Test overview',
      posterPath: '/poster.jpg',
    ),
  ];

  test('should get watchlist TV shows from repository', () async {
    // arrange
    when(mockTvRepository.getWatchlistTvShow())
        .thenAnswer((_) async => Right(tTvWatchlist));

    // act
    final result = await usecase.execute();

    // assert
    expect(result, Right(tTvWatchlist));
    verify(mockTvRepository.getWatchlistTvShow());
    verifyNoMoreInteractions(mockTvRepository);
  });
}
