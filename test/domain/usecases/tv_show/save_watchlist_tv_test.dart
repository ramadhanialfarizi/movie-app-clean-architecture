import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/save_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SaveWatchlistTv(repository: mockTvRepository);
  });

  test(
    "save watch list tv show",
    () async {
      when(mockTvRepository.saveWatchlist(tvDummyDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));

      final result = await usecase.execute(tvDummyDetail);

      verify(mockTvRepository.saveWatchlist(tvDummyDetail));
      expect(result, Right('Added to Watchlist'));
    },
  );
}
