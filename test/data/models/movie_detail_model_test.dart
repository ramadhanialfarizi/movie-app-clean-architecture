import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/movie_detail_model.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movieDetailResponse = MovieDetailResponse(
    adult: false,
    backdropPath: '/path.jpg',
    budget: 100000,
    genres: [GenreModel(id: 1, name: 'Action')],
    homepage: 'https://homepage.com',
    id: 1,
    imdbId: 'tt1234567',
    originalLanguage: 'en',
    originalTitle: 'Original Title',
    overview: 'Overview of the movie',
    popularity: 9.9,
    posterPath: '/poster.jpg',
    releaseDate: '2023-01-01',
    revenue: 1000000,
    runtime: 120,
    status: 'Released',
    tagline: 'Some tagline',
    title: 'Movie Title',
    video: false,
    voteAverage: 8.5,
    voteCount: 1000,
  );

  final movieJson = {
    "adult": false,
    "backdrop_path": "/path.jpg",
    "budget": 100000,
    "genres": [
      {"id": 1, "name": "Action"}
    ],
    "homepage": "https://homepage.com",
    "id": 1,
    "imdb_id": "tt1234567",
    "original_language": "en",
    "original_title": "Original Title",
    "overview": "Overview of the movie",
    "popularity": 9.9,
    "poster_path": "/poster.jpg",
    "release_date": "2023-01-01",
    "revenue": 1000000,
    "runtime": 120,
    "status": "Released",
    "tagline": "Some tagline",
    "title": "Movie Title",
    "video": false,
    "vote_average": 8.5,
    "vote_count": 1000
  };

  group('MovieDetailResponse', () {
    test('fromJson should return valid model', () {
      final result = MovieDetailResponse.fromJson(movieJson);
      expect(result, movieDetailResponse);
    });

    test('toJson should return valid map', () {
      final result = movieDetailResponse.toJson();
      expect(result, movieJson);
    });

    test('toEntity should convert to MovieDetail correctly', () {
      final result = movieDetailResponse.toEntity();
      expect(
        result,
        MovieDetail(
          adult: false,
          backdropPath: '/path.jpg',
          genres: [GenreModel(id: 1, name: 'Action').toEntity()],
          id: 1,
          originalTitle: 'Original Title',
          overview: 'Overview of the movie',
          posterPath: '/poster.jpg',
          releaseDate: '2023-01-01',
          runtime: 120,
          title: 'Movie Title',
          voteAverage: 8.5,
          voteCount: 1000,
        ),
      );
    });

    test('Equatable props should match', () {
      expect(movieDetailResponse.props, [
        false,
        '/path.jpg',
        100000,
        [GenreModel(id: 1, name: 'Action')],
        'https://homepage.com',
        1,
        'tt1234567',
        'en',
        'Original Title',
        'Overview of the movie',
        9.9,
        '/poster.jpg',
        '2023-01-01',
        1000000,
        120,
        'Released',
        'Some tagline',
        'Movie Title',
        false,
        8.5,
        1000,
      ]);
    });
  });
}
