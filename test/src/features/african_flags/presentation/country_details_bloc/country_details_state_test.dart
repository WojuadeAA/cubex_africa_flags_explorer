import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/capital_info.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/car.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/coat_of_arms.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_details_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/currency.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/demonym.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/idd.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/maps.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/postal_code.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/transalation.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/country_details_bloc/country_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const countryDetails = CountryDetails(
    name: CountryNameModel(
      common: "Nigeria",
      official: "Federal Republic of Nigeria",
      nativeName: {"eng": CountryNativeName(common: "Nigeria", official: "Federal Republic of Nigeria")},
    ),
    tld: [".ng"],
    cca2: "NG",
    ccn3: "566",
    cca3: "NGA",
    cioc: "NGR",
    independent: true,
    status: "officially-assigned",
    unMember: true,
    currencies: {
      "NGN": Currency(name: "Nigerian naira", symbol: "₦"),
    },
    idd: Idd(root: "+2", suffixes: ["34"]),
    capital: ["Abuja"],
    altSpellings: ["NG", "Nijeriya", "Naíjíríà", "Federal Republic of Nigeria"],
    region: "Africa",
    subregion: "Western Africa",
    languages: {"eng": "English"},
    translations: {
      "ara": Translation(official: "جمهورية نيجيريا الاتحادية", common: "نيجيريا"),
      "bre": Translation(official: "Republik Kevreadel Nigeria", common: "Nigeria"),
      "ces": Translation(official: "Nigerijská federativní republika", common: "Nigérie"),
      "cym": Translation(official: "Federal Republic of Nigeria", common: "Nigeria"),
      "deu": Translation(official: "Bundesrepublik Nigeria", common: "Nigeria"),
      "est": Translation(official: "Nigeeria Liitvabariik", common: "Nigeeria"),
      "fin": Translation(official: "Nigerian liittotasavalta", common: "Nigeria"),
      "fra": Translation(official: "République fédérale du Nigeria", common: "Nigéria"),
      "hrv": Translation(official: "Savezna Republika Nigerija", common: "Nigerija"),
      "hun": Translation(official: "Nigéria", common: "Nigéria"),
      "ita": Translation(official: "Repubblica federale di Nigeria", common: "Nigeria"),
      "jpn": Translation(official: "ナイジェリア連邦共和国", common: "ナイジェリア"),
      "kor": Translation(official: "나이지리아 연방 공화국", common: "나이지리아"),
      "nld": Translation(official: "Federale Republiek Nigeria", common: "Nigeria"),
      "per": Translation(official: "جمهوری فدرال نیجریه", common: "نیجریه"),
      "pol": Translation(official: "Federalna Republika Nigerii", common: "Nigeria"),
      "por": Translation(official: "República Federal da Nigéria", common: "Nigéria"),
      "rus": Translation(official: "Федеративная Республика Нигерия", common: "Нигерия"),
      "slk": Translation(official: "Nigérijská federatívna republika", common: "Nigéria"),
      "spa": Translation(official: "República Federal de Nigeria", common: "Nigeria"),
      "srp": Translation(official: "Савезна Република Нигерија", common: "Нигерија "),
      "swe": Translation(official: "Förbundsrepubliken Nigeria", common: "Nigeria"),
      "tur": Translation(official: "Nijerya Federal Cumhuriyeti", common: "Nijerya"),
      "urd": Translation(official: "وفاقی جمہوریہ نائجیریا", common: "نائجیریا"),
      "zho": Translation(official: "尼日利亚联邦共和国", common: "尼日利亚"),
    },
    latlng: [10, 8],
    landlocked: false,
    borders: ["BEN", "CMR", "TCD", "NER"],
    area: 923768,
    demonyms: {
      "eng": Demonym(f: "Nigerian", m: "Nigerian"),
      "fra": Demonym(f: "Nigériane", m: "Nigérian"),
    },
    flag: "🇳🇬",
    maps: Maps(
      googleMaps: "https://goo.gl/maps/LTn417qWwBPFszuV9",
      openStreetMaps: "https://www.openstreetmap.org/relation/192787",
    ),
    population: 206139587,
    gini: {"2018": 35.1},
    fifa: "NGA",
    car: Car(signs: ["WAN"], side: "right"),
    timezones: ["UTC+01:00"],
    continents: ["Africa"],
    flags: CountryFlags(
      png: "https://flagcdn.com/w320/ng.png",
      svg: "https://flagcdn.com/ng.svg",
      alt: "The flag of Nigeria is composed of three equal vertical bands of green, white and green.",
    ),
    coatOfArms: CoatOfArms(
      png: "https://mainfacts.com/media/images/coats_of_arms/ng.png",
      svg: "https://mainfacts.com/media/images/coats_of_arms/ng.svg",
    ),
    startOfWeek: "monday",
    capitalInfo: CapitalInfo(
      latlng: [9.08, 7.53],
    ),
    postalCode: PostalCode(format: "######", regex: "^(\\d{6})\$"),
  );

  group('CountryDetailsStateTests', () {
    group('CountryDetailsInitial', () {
      test('two instances should be equal', () {
        expect(CountryDetailsInitial(), CountryDetailsInitial());
      });

      test('props should be empty', () {
        expect(CountryDetailsInitial().props, isEmpty);
      });
    });

    group('CountryDetailsLoading', () {
      test('two instances should be equal', () {
        expect(CountryDetailsLoading(), CountryDetailsLoading());
      });

      test('props should be empty', () {
        expect(CountryDetailsLoading().props, isEmpty);
      });
    });

    group('CountryDetailsLoaded', () {
      test('two instances with the same details should be equal', () {
        expect(const CountryDetailsLoaded(countryDetails: countryDetails),
            const CountryDetailsLoaded(countryDetails: countryDetails));
      });

      test('prop should not be empty', () {
        expect(const CountryDetailsLoaded(countryDetails: countryDetails).props, isNotEmpty);
      });
    });

    group('CountryDetailsFailure', () {
      const failure = CommonFailure("title", "message");
      const differentFailure = CommonFailure("different title", "different message");

      test('two instances with the same failure should be equal', () {
        expect(const CountryDetailsFailure(failure), const CountryDetailsFailure(failure));
      });

      test('two instances with different failures should not be equal', () {
        expect(const CountryDetailsFailure(failure), isNot(equals(const CountryDetailsFailure(differentFailure))));
      });

      test('props should contain failure', () {
        expect(const CountryDetailsFailure(failure).props, [failure]);
      });
    });
    test('different event types should not be equal', () {
      expect(CountryDetailsLoading(), isNot(CountryDetailsInitial()));
    });
  });
}
