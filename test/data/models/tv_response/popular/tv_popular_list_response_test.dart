import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv popular response to json",
    () {
      final result = tvPopularListResponse.toJson();
      expect(result, tvPopularListResponse.toJson());
    },
  );
}
