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
import 'package:flutter_test/flutter_test.dart';

void main() {
  final countryDetailsJson = {
    "name": {
      "common": "Nigeria",
      "official": "Federal Republic of Nigeria",
      "nativeName": {
        "eng": {"official": "Federal Republic of Nigeria", "common": "Nigeria"}
      }
    },
    "tld": [".ng"],
    "cca2": "NG",
    "ccn3": "566",
    "cca3": "NGA",
    "cioc": "NGR",
    "independent": true,
    "status": "officially-assigned",
    "unMember": true,
    "currencies": {
      "NGN": {"name": "Nigerian naira", "symbol": "₦"}
    },
    "idd": {
      "root": "+2",
      "suffixes": ["34"]
    },
    "capital": ["Abuja"],
    "altSpellings": ["NG", "Nijeriya", "Naíjíríà", "Federal Republic of Nigeria"],
    "region": "Africa",
    "subregion": "Western Africa",
    "languages": {"eng": "English"},
    "translations": {
      "ara": {"official": "جمهورية نيجيريا الاتحادية", "common": "نيجيريا"},
      "bre": {"official": "Republik Kevreadel Nigeria", "common": "Nigeria"},
      "ces": {"official": "Nigerijská federativní republika", "common": "Nigérie"},
      "cym": {"official": "Federal Republic of Nigeria", "common": "Nigeria"},
      "deu": {"official": "Bundesrepublik Nigeria", "common": "Nigeria"},
      "est": {"official": "Nigeeria Liitvabariik", "common": "Nigeeria"},
      "fin": {"official": "Nigerian liittotasavalta", "common": "Nigeria"},
      "fra": {"official": "République fédérale du Nigeria", "common": "Nigéria"},
      "hrv": {"official": "Savezna Republika Nigerija", "common": "Nigerija"},
      "hun": {"official": "Nigéria", "common": "Nigéria"},
      "ita": {"official": "Repubblica federale di Nigeria", "common": "Nigeria"},
      "jpn": {"official": "ナイジェリア連邦共和国", "common": "ナイジェリア"},
      "kor": {"official": "나이지리아 연방 공화국", "common": "나이지리아"},
      "nld": {"official": "Federale Republiek Nigeria", "common": "Nigeria"},
      "per": {"official": "جمهوری فدرال نیجریه", "common": "نیجریه"},
      "pol": {"official": "Federalna Republika Nigerii", "common": "Nigeria"},
      "por": {"official": "República Federal da Nigéria", "common": "Nigéria"},
      "rus": {"official": "Федеративная Республика Нигерия", "common": "Нигерия"},
      "slk": {"official": "Nigérijská federatívna republika", "common": "Nigéria"},
      "spa": {"official": "República Federal de Nigeria", "common": "Nigeria"},
      "srp": {"official": "Савезна Република Нигерија", "common": "Нигерија "},
      "swe": {"official": "Förbundsrepubliken Nigeria", "common": "Nigeria"},
      "tur": {"official": "Nijerya Federal Cumhuriyeti", "common": "Nijerya"},
      "urd": {"official": "وفاقی جمہوریہ نائجیریا", "common": "نائجیریا"},
      "zho": {"official": "尼日利亚联邦共和国", "common": "尼日利亚"}
    },
    "latlng": [10, 8],
    "landlocked": false,
    "borders": ["BEN", "CMR", "TCD", "NER"],
    "area": 923768,
    "demonyms": {
      "eng": {"f": "Nigerian", "m": "Nigerian"},
      "fra": {"f": "Nigériane", "m": "Nigérian"}
    },
    "flag": "🇳🇬",
    "maps": {
      "googleMaps": "https://goo.gl/maps/LTn417qWwBPFszuV9",
      "openStreetMaps": "https://www.openstreetmap.org/relation/192787"
    },
    "population": 206139587,
    "gini": {"2018": 35.1},
    "fifa": "NGA",
    "car": {
      "signs": ["WAN"],
      "side": "right"
    },
    "timezones": ["UTC+01:00"],
    "continents": ["Africa"],
    "flags": {
      "png": "https://flagcdn.com/w320/ng.png",
      "svg": "https://flagcdn.com/ng.svg",
      "alt": "The flag of Nigeria is composed of three equal vertical bands of green, white and green."
    },
    "coatOfArms": {
      "png": "https://mainfacts.com/media/images/coats_of_arms/ng.png",
      "svg": "https://mainfacts.com/media/images/coats_of_arms/ng.svg"
    },
    "startOfWeek": "monday",
    "capitalInfo": {
      "latlng": [9.08, 7.53]
    },
    "postalCode": {"format": "######", "regex": "^(\\d{6})\$"}
  };
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

  group('Country Details Model', () {
    test('fromJson creates correct CountryDetails instance', () {
      expect(CountryDetails.fromJson(countryDetailsJson), equals(countryDetails));
    });

    test('toJson returns correct JSON map', () {
      expect(countryDetails.toJson(), equals(countryDetailsJson));
    });
  });
}
