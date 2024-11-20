import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvRepositoryImpl tvRepository;
  late MockTvLocalDataSource mockTvLocalDataSource;
  late MockTvRemoteDataSource mockTvRemoteDataSource;

  setUp(
    () {
      mockTvRemoteDataSource = MockTvRemoteDataSource();
      mockTvLocalDataSource = MockTvLocalDataSource();
      tvRepository = TvRepositoryImpl(
        tvRemoteDataSource: mockTvRemoteDataSource,
        localDataSource: mockTvLocalDataSource,
      );
    },
  );

  group(
    "Now playing tv show",
    () {
      test(
        "should return tv show now playing data",
        () {},
      );
    },
  );
}
