import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv season to json",
    () {
      final result = seasonResponse.toJson();
      expect(result, seasonResponse.toJson());
    },
  );
}
