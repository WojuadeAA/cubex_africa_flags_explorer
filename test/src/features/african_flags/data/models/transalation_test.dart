import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/transalation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final translationJson = {"official": "جمهورية نيجيريا الاتحادية", "common": "نيجيريا"};
  const translation = Translation(
    official: "جمهورية نيجيريا الاتحادية",
    common: "نيجيريا",
  );

  group('Translation Tests', () {
    test('fromJson creates correct Translation instance', () {
      expect(Translation.fromJson(translationJson), equals(translation));
    });

    test('toJson returns correct JSON map', () {
      expect(translation.toJson(), equals(translationJson));
    });
  });
}
