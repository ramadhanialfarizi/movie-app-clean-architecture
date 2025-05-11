import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testMovieDetail = MovieDetail(
    adult: false,
    backdropPath: '/path.jpg',
    genres: [],
    id: 1,
    originalTitle: 'Original Title',
    overview: 'Movie overview',
    posterPath: '/poster.jpg',
    releaseDate: '2023-01-01',
    runtime: 120,
    title: 'Movie Title',
    voteAverage: 8.5,
    voteCount: 999,
  );

  final testMovieTable = MovieTable(
    id: 1,
    title: 'Movie Title',
    posterPath: '/poster.jpg',
    overview: 'Movie overview',
  );

  final testMap = {
    'id': 1,
    'title': 'Movie Title',
    'posterPath': '/poster.jpg',
    'overview': 'Movie overview',
  };

  group('MovieTable', () {
    test('fromEntity should return valid MovieTable', () {
      final result = MovieTable.fromEntity(testMovieDetail);
      expect(result, testMovieTable);
    });

    test('fromMap should return valid MovieTable', () {
      final result = MovieTable.fromMap(testMap);
      expect(result, testMovieTable);
    });

    test('toJson should return correct map', () {
      final result = testMovieTable.toJson();
      expect(result, testMap);
    });

    test('toEntity should return correct Movie entity', () {
      final result = testMovieTable.toEntity();
      expect(
          result,
          Movie.watchlist(
            id: 1,
            title: 'Movie Title',
            posterPath: '/poster.jpg',
            overview: 'Movie overview',
          ));
    });

    test('props should contain all values', () {
      expect(testMovieTable.props,
          [1, 'Movie Title', '/poster.jpg', 'Movie overview']);
    });
  });
}
