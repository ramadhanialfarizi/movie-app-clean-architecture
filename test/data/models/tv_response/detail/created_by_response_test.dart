import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv create by response to json",
    () {
      final result = createdByResponse.toJson();
      expect(result, createdByResponse.toJson());
    },
  );
}
