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
}
