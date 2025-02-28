import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/coat_of_arms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final coatOfArmsJson = {
    "png": "https://mainfacts.com/media/images/coats_of_arms/ng.png",
    "svg": "https://mainfacts.com/media/images/coats_of_arms/ng.svg"
  };
  const coatOfArms = CoatOfArms(
    png: "https://mainfacts.com/media/images/coats_of_arms/ng.png",
    svg: "https://mainfacts.com/media/images/coats_of_arms/ng.svg",
  );
  group('coat of arms test', () {
    test('fromJson creates correct CoatOfArms instance', () {
      expect(CoatOfArms.fromJson(coatOfArmsJson), equals(coatOfArms));
    });
    test('toJson returns correct JSON map', () {
      expect(coatOfArms.toJson(), equals(coatOfArmsJson));
    });
  });
}
