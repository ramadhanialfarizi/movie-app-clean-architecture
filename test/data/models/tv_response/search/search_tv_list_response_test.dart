import 'package:ditonton/data/models/tv_response/search/search_tv_data_response.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv top rated response to json",
    () {
      final result = searchTvListResponse.toJson();
      expect(result, searchTvListResponse.toJson());
    },
  );

  group('SearchTvListResponse props', () {
    test('should return the correct list of properties', () {
      // Arrange
      final searchTvData = SearchTvDataResponse(
        adult: true,
        backdropPath: "/testBackdrop.jpg",
        genreIds: [1, 2, 3],
        id: 101,
        originCountry: ["US"],
        originalLanguage: "en",
        originalName: "Original Name",
        overview: "Test Overview",
        popularity: 99.9,
        posterPath: "/testPoster.jpg",
        firstAirDate: "2022-01-01",
        name: "Test Name",
        voteAverage: 8.5,
        voteCount: 1000,
      );

      final searchTvListResponse = SearchTvListResponse(
        page: 1,
        results: [searchTvData],
        totalPages: 10,
        totalResults: 100,
      );

      // Act
      final result = searchTvListResponse.props;

      // Assert
      expect(result, [
        1,
        [searchTvData],
        10,
        100,
      ]);
    });

    test('should handle null values correctly', () {
      // Arrange
      final searchTvListResponse = SearchTvListResponse();

      // Act
      final result = searchTvListResponse.props;

      // Assert
      expect(result, [
        null,
        null,
        null,
        null,
      ]);
    });
  });
}
