import 'dart:convert';

import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Country Model', () {
    final countryJson = {
      "flags": {
        "png": "https://flagcdn.com/w320/ng.png",
        "svg": "https://flagcdn.com/ng.svg",
        "alt":
            "The flag of Nigeria is composed of three equal vertical bands of green, white and green."
      },
      "name": {
        "common": "Nigeria",
        "official": "Federal Republic of Nigeria",
        "nativeName": {
          "eng": {
            "official": "Federal Republic of Nigeria",
            "common": "Nigeria"
          }
        }
      },
      "capital": ["Abuja"],
      "languages": {"eng": "English"}
    };

    const country = Country(
      flags: CountryFlags(
        png: "https://flagcdn.com/w320/ng.png",
        svg: "https://flagcdn.com/ng.svg",
        alt:
            "The flag of Nigeria is composed of three equal vertical bands of green, white and green.",
      ),
      name: CountryNameModel(
        common: "Nigeria",
        official: "Federal Republic of Nigeria",
        nativeName: {
          "eng": CountryNativeName(
            official: "Federal Republic of Nigeria",
            common: "Nigeria",
          )
        },
      ),
      capital: ["Abuja"],
      languages: {"eng": "English"},
    );

    test('fromJson creates correct Country instance', () {
      final result = Country.fromJson(countryJson);

      expect(result.name.common, equals("Nigeria"));
      expect(result.capital.first, equals("Abuja"));
      expect(result.languages["eng"], equals("English"));
      expect(result.flags.png, contains("ng.png"));
    });

    test('toJson returns correct JSON map', () {
      final result = country.toJson();

      expect(result, equals(countryJson));
    });

    test('full serialization/deserialization cycle', () {
      final jsonString = jsonEncode(country.toJson());
      final decodedJson = jsonDecode(jsonString);
      final reconstructed = Country.fromJson(decodedJson);

      expect(reconstructed, equals(country));
    });
  });
}
