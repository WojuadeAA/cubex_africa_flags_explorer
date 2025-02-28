import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CountryNativeName Model', () {
    final nativeNameJson = {
      "official": "Federal Republic of Nigeria",
      "common": "Nigeria"
    };

    const nativeName = CountryNativeName(
      official: "Federal Republic of Nigeria",
      common: "Nigeria",
    );

    test('fromJson creates correct CountryNativeName instance', () {
      expect(CountryNativeName.fromJson(nativeNameJson), equals(nativeName));
    });

    test('toJson returns correct JSON map', () {
      expect(nativeName.toJson(), equals(nativeNameJson));
    });
  });
}
