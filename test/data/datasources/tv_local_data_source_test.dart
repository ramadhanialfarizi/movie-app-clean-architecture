import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../dummy_data/tv_dummy/tv_dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save tv watchlist', () {
    MovieTable paramTest = MovieTable(
      id: tvDummyDetail.id ?? 0,
      title: tvDummyDetail.name,
      posterPath: tvDummyDetail.posterPath,
      overview: tvDummyDetail.overview,
    );
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(paramTest))
          .thenAnswer((_) async => 1);

      // act
      final result = await dataSource.insertWatchlist(paramTest);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(paramTest))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(paramTest);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove tv watchlist', () {
    MovieTable paramTest = MovieTable(
      id: tvDummyDetail.id ?? 0,
      title: tvDummyDetail.name,
      posterPath: tvDummyDetail.posterPath,
      overview: tvDummyDetail.overview,
    );
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(paramTest))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(paramTest);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(paramTest))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(paramTest);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('fetch tv Detail By Id', () {
    final testId = tvDummyDetail.id;

    test('should return tv show detail when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(testId))
          .thenAnswer((_) async => testTvShowJson);
      // act
      final result = await dataSource.getTvShowById(testId ?? 0);
      // assert
      expect(result, testMovieTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getMovieById(testId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvShowById(testId ?? 0);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv show', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistMovies())
          .thenAnswer((_) async => [testMovieMap]);
      // act
      final result = await dataSource.getWatchlistTv();
      // assert
      expect(result, [testMovieTable]);
    });
  });
}
