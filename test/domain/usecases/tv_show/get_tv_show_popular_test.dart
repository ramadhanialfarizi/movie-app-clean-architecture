import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowPopular usecase;
  late MockTvRepository mockTvRepository;

  setUp(
    () {
      mockTvRepository = MockTvRepository();
      usecase = GetTvShowPopular(mockTvRepository);
    },
  );

  test(
    "get popular tv show",
    () async {
      when(mockTvRepository.getPopularTvShow())
          .thenAnswer((_) async => Right(tvPopularListResponse));

      final result = await usecase.executeProcess();
      expect(result, Right(tvPopularListResponse));
    },
  );
}
