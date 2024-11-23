import 'package:ditonton/domain/usecases/tv_show/get_watchlist_tv_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvStatus usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetWatchlistTvStatus(repository: mockTvRepository);
  });

  test(
    "get watchlist tv status",
    () async {
      int id = 1111;
      when(mockTvRepository.isAddedToWatchlist(id))
          .thenAnswer((_) async => true);

      final result = await usecase.execute(id);
      expect(result, true);
    },
  );
}
