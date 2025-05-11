import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late DatabaseHelper dbHelper;

  // Initialize sqflite ffi before tests run
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    // Clean database before each test
    await db!.delete('watchlist');
    await db.delete('watchlistTvSHow');
  });

  final testMovie = MovieTable(
    id: 1,
    title: 'Test Movie',
    overview: 'Test Overview',
    posterPath: '/test.jpg',
  );

  group('DatabaseHelper', () {
    test('should insert and retrieve movie from watchlist', () async {
      await dbHelper.insertWatchlist(testMovie);
      final result = await dbHelper.getMovieById(testMovie.id);

      expect(result, isNotNull);
      expect(result!['title'], testMovie.title);
    });

    test('should delete movie from watchlist', () async {
      await dbHelper.insertWatchlist(testMovie);
      await dbHelper.removeWatchlist(testMovie);

      final result = await dbHelper.getMovieById(testMovie.id);
      expect(result, isNull);
    });

    test('should return all movies from watchlist', () async {
      await dbHelper.insertWatchlist(testMovie);
      final result = await dbHelper.getWatchlistMovies();

      expect(result, isA<List<Map<String, dynamic>>>());
      expect(result.length, 1);
      expect(result.first['title'], testMovie.title);
    });
  });
}
