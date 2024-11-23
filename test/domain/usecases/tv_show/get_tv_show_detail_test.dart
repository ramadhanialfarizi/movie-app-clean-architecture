import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvShowDetail usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvShowDetail(mockTvRepository);
  });

  test(
    "get detail tv show",
    () async {
      int id = 1111;
      when(mockTvRepository.getDetailTvShow(id))
          .thenAnswer((_) async => Right(tvDummyDetail));

      final result = await usecase.executeProcess(id);
      expect(result, Right(tvDummyDetail));
    },
  );
}
