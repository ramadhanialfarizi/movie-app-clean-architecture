import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:ditonton/presentation/bloc/tv_show/search_tv/search_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'search_tv_bloc_test.mocks.dart';

@GenerateMocks([SearchTvShow])
void main() {
  late SearchTvBloc searchTvBloc;
  late MockSearchTvShow mockSearchTvShow;

  setUp(
    () {
      mockSearchTvShow = MockSearchTvShow();
      searchTvBloc = SearchTvBloc(mockSearchTvShow);
    },
  );

  test('initial state should be empty', () {
    expect(searchTvBloc.state, SearchTvEmpty());
  });

  group(
    "test bloc",
    () {
      final tQuery = 'titanic';
      blocTest<SearchTvBloc, SearchTvState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSearchTvShow.executeProcess(tQuery))
              .thenAnswer((_) async => Right(tvListModel));
          return searchTvBloc;
        },
        act: (bloc) => bloc.add(OnQuerySearchTv(tQuery)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          SearchTvLoading(),
          SearchTvHasData(tvListModel),
        ],
        verify: (bloc) {
          verify(mockSearchTvShow.executeProcess(tQuery));
        },
      );

      blocTest<SearchTvBloc, SearchTvState>(
        'Should emit [Loading, Error] when get search is unsuccessful',
        build: () {
          when(mockSearchTvShow.executeProcess(tQuery))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return searchTvBloc;
        },
        act: (bloc) => bloc.add(OnQuerySearchTv(tQuery)),
        expect: () => [
          SearchTvLoading(),
          SearchTvError('Server Failure'),
        ],
        wait: const Duration(milliseconds: 500),
        verify: (bloc) {
          verify(mockSearchTvShow.executeProcess(tQuery));
        },
      );
    },
  );
}
