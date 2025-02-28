import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/capital_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final capitalInfoJson = {
    "latlng": [9.08, 7.53]
  };
  const CapitalInfo capitalInfo = CapitalInfo(
    latlng: [9.08, 7.53],
  );

  group("Capital Info Tests", () {
    test("fromJson  creates Correct CapitalInfo instance", () {
      expect(CapitalInfo.fromJson(capitalInfoJson), equals(capitalInfo));
    });

    test("toJson  retursn correct JSON Map", () {
      expect(capitalInfoJson, capitalInfo.toJson());
    });
  });
}
