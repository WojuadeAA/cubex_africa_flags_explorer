import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Flags Model', () {
    final flagsJson = {
      "png": "https://flagcdn.com/w320/ng.png",
      "svg": "https://flagcdn.com/ng.svg",
      "alt": "The flag of Nigeria is composed of three equal vertical bands of green, white and green."
    };

    const flags = CountryFlags(
      png: "https://flagcdn.com/w320/ng.png",
      svg: "https://flagcdn.com/ng.svg",
      alt: "The flag of Nigeria is composed of three equal vertical bands of green, white and green.",
    );

    test('fromJson creates correct Flags instance', () {
      expect(CountryFlags.fromJson(flagsJson), equals(flags));
    });

    test('toJson returns correct JSON map', () {
      expect(flags.toJson(), equals(flagsJson));
    });
  });
}
