import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/country_details_bloc/country_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CountryDetailsEvent", () {
    test("two instances should be equal", () {
      expect(const FetchCountryDetails(countryName: "Ghana"), const FetchCountryDetails(countryName: "Ghana"));
    });

    test("props should not be empty", () {
      expect(const FetchCountryDetails(countryName: "Ghana").props, isNotEmpty);
    });

    test('different event types should not be equal ', () {
      expect(const FetchCountryDetails(countryName: "Ghana"), isNot(const FetchCountryDetails(countryName: "Kenya")));
    });
  });
}
