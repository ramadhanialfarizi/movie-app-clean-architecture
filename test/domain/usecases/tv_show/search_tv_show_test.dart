import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvShow usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SearchTvShow(mockTvRepository);
  });

  test(
    "serch watch list tv show",
    () async {
      String query = "Better Call Saul";

      when(mockTvRepository.searchTv(query))
          .thenAnswer((_) async => Right(tvListModel));

      final result = await usecase.executeProcess(query);

      expect(result, Right(searchTvListResponse));
    },
  );
}
