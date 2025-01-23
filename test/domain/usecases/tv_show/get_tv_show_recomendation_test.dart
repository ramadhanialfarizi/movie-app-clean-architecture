import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_recomendation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowRecomendation usecase;
  late MockTvRepository mockTvRepository;

  setUp(
    () {
      mockTvRepository = MockTvRepository();
      usecase = GetTvShowRecomendation(mockTvRepository);
    },
  );

  test(
    "get tv show recomendation",
    () async {
      int id = 1111;
      when(mockTvRepository.getRecomendationTvShow(id))
          .thenAnswer((_) async => Right(tvListModel));

      final result = await usecase.executeProcess(id);
      expect(result, Right(tvListModel));
    },
  );
}
