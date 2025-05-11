import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var genreModel = GenreModel(id: 1, name: 'Action');

  final genreJson = {
    "id": 1,
    "name": "Action",
  };

  group('GenreModel', () {
    test('fromJson should return valid model', () {
      final result = GenreModel.fromJson(genreJson);
      expect(result, genreModel);
    });

    test('toJson should return valid map', () {
      final result = genreModel.toJson();
      expect(result, genreJson);
    });

    test('toEntity should return Genre entity', () {
      final result = genreModel.toEntity();
      expect(result, Genre(id: 1, name: 'Action'));
    });

    test('props should return correct list for equatable', () {
      expect(genreModel.props, [1, 'Action']);
    });
  });
}
