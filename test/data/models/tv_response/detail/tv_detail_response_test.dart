import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv detail episode to air to json",
    () {
      final result = tvDummyDetail.toJson();
      expect(result, tvDummyDetail.toJson());
    },
  );
}
