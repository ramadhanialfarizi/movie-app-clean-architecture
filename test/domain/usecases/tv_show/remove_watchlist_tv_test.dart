import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/remove_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = RemoveWatchlistTv(repository: mockTvRepository);
  });

  test(
    "remove thv watchlist use case",
    () async {
      when(mockTvRepository.removeWatchlist(tvDummyDetail))
          .thenAnswer((_) async => Right('Removed from watchlist'));
      // act
      final result = await usecase.execute(tvDummyDetail);
      // assert
      verify(mockTvRepository.removeWatchlist(tvDummyDetail));
      expect(result, Right('Removed from watchlist'));
    },
  );
}
