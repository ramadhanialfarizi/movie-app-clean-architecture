import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/tv_dummy/tv_dummy_objects.dart';

void main() {
  test(
    "tv production company to json",
    () {
      final result = productionCompanyResponse.toJson();
      expect(result, productionCompanyResponse.toJson());
    },
  );
}
