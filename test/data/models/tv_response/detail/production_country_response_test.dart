import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv production country to json",
    () {
      final result = productionCountryResponse.toJson();
      expect(result, productionCountryResponse.toJson());
    },
  );
}
