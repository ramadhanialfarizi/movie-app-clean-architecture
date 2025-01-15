import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_on_air.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowOnAir usecase;
  late MockTvRepository mockTvRepository;

  setUp(
    () {
      mockTvRepository = MockTvRepository();
      usecase = GetTvShowOnAir(mockTvRepository);
    },
  );

  test(
    "get tv show on air",
    () async {
      when(mockTvRepository.getOnAirTvShow())
          .thenAnswer((_) async => Right(tvListModel));

      final result = await usecase.executeProcess();
      expect(result, Right(tvListModel));
    },
  );
}
