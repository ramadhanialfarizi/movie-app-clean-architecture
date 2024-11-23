import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv spoken language to json",
    () {
      final result = spokenLanguageResponse.toJson();
      expect(result, spokenLanguageResponse.toJson());
    },
  );
}
