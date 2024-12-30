import 'package:ditonton/data/models/tv_response/watchlist/tv_table_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  group(
    'test tv table model',
    () {
      test(
        "tv table model to json",
        () {
          final result = tvTableDataDummy.toJson();
          expect(result, tvTableDataDummy.toJson());
        },
      );

      test(
        'tv table model from json',
        () {
          final result = TvTableData.fromJson(testTvTableFromJson);

          expect(result.id, 1396);
          expect(result.title, 'Breaking Bad');
          expect(result.overview,
              "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.");
          expect(result.posterPath, "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg");
        },
      );
    },
  );

  group('TvTableData props', () {
    test('should return the correct list of properties', () {
      final tvTableData = TvTableData(
        id: 1,
        title: "Test Title",
        posterPath: "/testPosterPath.jpg",
        overview: "Test Overview",
      );

      final result = tvTableData.props;

      expect(result, [
        1,
        "Test Title",
        "/testPosterPath.jpg",
        "Test Overview",
      ]);
    });

    test('should handle null values correctly', () {
      final tvTableData = TvTableData(
        id: 2,
        title: null,
        posterPath: null,
        overview: null,
      );

      final result = tvTableData.props;

      expect(result, [
        2,
        null,
        null,
        null,
      ]);
    });
  });
}
