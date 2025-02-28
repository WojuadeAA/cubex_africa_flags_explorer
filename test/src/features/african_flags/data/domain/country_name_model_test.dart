import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CountryName Model', () {
    final nameJson = {
      "common": "Nigeria",
      "official": "Federal Republic of Nigeria",
      "nativeName": {
        "eng": {"official": "Federal Republic of Nigeria", "common": "Nigeria"}
      }
    };

    const name = CountryNameModel(
      common: "Nigeria",
      official: "Federal Republic of Nigeria",
      nativeName: {
        "eng": CountryNativeName(
          official: "Federal Republic of Nigeria",
          common: "Nigeria",
        )
      },
    );

    test('fromJson creates correct CountryName instance', () {
      final result = CountryNameModel.fromJson(nameJson);

      expect(result.common, equals("Nigeria"));
      expect(result.official, equals("Federal Republic of Nigeria"));
      expect(result.nativeName["eng"]?.common, equals("Nigeria"));
      expect(result.nativeName["eng"]?.official,
          equals("Federal Republic of Nigeria"));
    });

    test('toJson returns correct JSON map', () {
      final result = name.toJson();
      expect(result, equals(nameJson));
      expect(result["common"], equals("Nigeria"));
      expect(result["official"], equals("Federal Republic of Nigeria"));
      expect(result["nativeName"]["eng"]["common"], equals("Nigeria"));
      expect(result["nativeName"]["eng"]["official"],
          equals("Federal Republic of Nigeria"));
    });
  });
}
