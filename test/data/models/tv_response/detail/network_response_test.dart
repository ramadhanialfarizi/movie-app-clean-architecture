import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv network response to json",
    () {
      final result = networkResponse.toJson();
      expect(result, networkResponse.toJson());
    },
  );
}
