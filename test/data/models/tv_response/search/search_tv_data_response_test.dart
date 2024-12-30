import 'package:ditonton/data/models/tv_response/search/search_tv_data_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv top rated response to json",
    () {
      final result = searchTvDataResponse.toJson();
      expect(result, searchTvDataResponse.toJson());
    },
  );

  group('SearchTvDataResponse props', () {
    test('should return the correct list of properties', () {
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

      final result = searchTvData.props;

      expect(result, [
        true,
        "/testBackdrop.jpg",
        [1, 2, 3],
        101,
        ["US"],
        "en",
        "Original Name",
        "Test Overview",
        99.9,
        "/testPoster.jpg",
        "2022-01-01",
        "Test Name",
        8.5,
        1000,
      ]);
    });

    test('should handle null values correctly', () {
      final searchTvData = SearchTvDataResponse();

      final result = searchTvData.props;

      expect(result, [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      ]);
    });
  });
}
