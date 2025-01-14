import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv_show/search_tv_show.dart';
import 'package:ditonton/presentation/provider/tv_show/search_tv_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import 'search_tv_controller_test.mocks.dart';

@GenerateMocks([SearchTvShow])
void main() {
  late SearchTvController controller;
  late MockSearchTvShow mockSearchTvShow;

  setUp(
    () {
      mockSearchTvShow = MockSearchTvShow();
      controller = SearchTvController(searchTvShow: mockSearchTvShow);
    },
  );

  group(
    "test for search tv show",
    () {
      String query = "Better Call Saul";
      test('should get data from the usecase', () async {
        // arrange
        when(mockSearchTvShow.executeProcess(query))
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.searchData(query);
        // assert
        verify(mockSearchTvShow.executeProcess(query));
      });

      test('should change state to Loading when usecase is called', () {
        // arrange
        when(mockSearchTvShow.executeProcess(query))
            .thenAnswer((_) async => Right(tvListModel));
        // act
        controller.searchData(query);
        // assert
        expect(controller.state, RequestState.Loading);
      });

      test('should change movies when data is gotten successfully', () async {
        // arrange
        when(mockSearchTvShow.executeProcess(query))
            .thenAnswer((_) async => Right(tvListModel));
        // act
        await controller.searchData(query);
        // assert
        expect(controller.state, RequestState.Loaded);
        expect(controller.resultData, tvListModel);
      });

      test('should return error when data is unsuccessful', () async {
        // arrange
        when(mockSearchTvShow.executeProcess(query))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        // act
        await controller.searchData(query);
        // assert
        expect(controller.state, RequestState.Error);
        expect(controller.message, 'Server Failure');
      });
    },
  );
}
