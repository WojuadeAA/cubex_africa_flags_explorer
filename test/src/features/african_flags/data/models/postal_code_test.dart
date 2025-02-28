import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/postal_code.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final postalCodeJson = {
    "format": "######",
    "regex": "^(\\d{6})\$",
  };
  const postalCode = PostalCode(
    format: "######",
    regex: "^(\\d{6})\$",
  );
  group('PostalCode Tests', () {
    test('fromJson creates correct PostalCode instance', () {
      expect(PostalCode.fromJson(postalCodeJson), equals(postalCode));
    });

    test('toJson returns correct JSON map', () {
      expect(postalCode.toJson(), equals(postalCodeJson));
    });
  });
}
