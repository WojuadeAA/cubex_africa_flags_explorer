import 'package:cubex_africa_flags_explorer/src/core/constants/endpoints.dart';
import 'package:cubex_africa_flags_explorer/src/core/network/network_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/datasource/remote_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_details_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpService extends Mock implements HttpService {}

class MockResponse extends Mock implements Response {}

void main() {
  late AfricanFlagsRemoteServiceImpl service;
  late MockHttpService mockHttpService;
  late MockResponse mockResponse;

  setUp(() {
    mockHttpService = MockHttpService();
    mockResponse = MockResponse();
    service = AfricanFlagsRemoteServiceImpl(httpService: mockHttpService);
  });

  group('getCountries', () {
    final mockCountries = [
      {
        "flags": {
          "png": "https://flagcdn.com/w320/ls.png",
          "svg": "https://flagcdn.com/ls.svg",
          "alt":
              "The flag of Lesotho is composed of three horizontal bands of blue, white and green in the ratio of 3:4:3. A black mokorotlo — a Basotho hat — is centered in the white band."
        },
        "name": {
          "common": "Lesotho",
          "official": "Kingdom of Lesotho",
          "nativeName": {
            "eng": {"official": "Kingdom of Lesotho", "common": "Lesotho"},
            "sot": {"official": "Kingdom of Lesotho", "common": "Lesotho"}
          }
        },
        "capital": ["Maseru"],
        "languages": {"eng": "English", "sot": "Sotho"}
      },
      {
        "flags": {
          "png": "https://flagcdn.com/w320/cf.png",
          "svg": "https://flagcdn.com/cf.svg",
          "alt":
              "The flag of Central African Republic is composed of four equal horizontal bands of blue, white, green and yellow intersected at the center by a vertical red band of equal size as the horizontal bands. A yellow five-pointed star is situated on the hoist side of the blue band."
        },
        "name": {
          "common": "Central African Republic",
          "official": "Central African Republic",
          "nativeName": {
            "fra": {"official": "République centrafricaine", "common": "République centrafricaine"},
            "sag": {"official": "Ködörösêse tî Bêafrîka", "common": "Bêafrîka"}
          }
        },
        "capital": ["Bangui"],
        "languages": {"fra": "French", "sag": "Sango"}
      },
      {
        "flags": {
          "png": "https://flagcdn.com/w320/ma.png",
          "svg": "https://flagcdn.com/ma.svg",
          "alt":
              "The flag of Morocco features a green pentagram — a five-pointed linear star — centered on a red field."
        },
        "name": {
          "common": "Morocco",
          "official": "Kingdom of Morocco",
          "nativeName": {
            "ara": {"official": "المملكة المغربية", "common": "المغرب"},
            "ber": {"official": "ⵜⴰⴳⵍⴷⵉⵜ ⵏ ⵍⵎⵖⵔⵉⴱ", "common": "ⵍⵎⴰⵖⵔⵉⴱ"}
          }
        },
        "capital": ["Rabat"],
        "languages": {"ara": "Arabic", "ber": "Berber"}
      },
    ];
    test('successfully returns list of Country models', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries)).thenAnswer((_) async => mockResponse);
      when(() => mockResponse.statusCode).thenReturn(200);

      when(() => mockResponse.data).thenReturn(mockCountries);
      // Act
      final result = await service.getCountries();

      // Assert
      expect(result, isA<List<Country>>());
      expect(result.length, 3);
      expect(result[0].name.common, 'Lesotho');
      expect(result[1].name.common, 'Central African Republic');
      expect(result[2].name.common, 'Morocco');
      verify(() => mockHttpService.get(Endpoints.africanCountries)).called(1);
    });

    test('throws exception when response data is invalid', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries)).thenAnswer((_) async => mockResponse);
      when(() => mockResponse.data).thenReturn({'invalid': 'data'});

      // Act & Assert
      expect(() => service.getCountries(), throwsA(isA<Exception>()));
    });

    test('throws exception when http call fails', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries)).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => service.getCountries(), throwsA(isA<Exception>()));
    });

    test('processes empty country list correctly', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries)).thenAnswer((_) async => mockResponse);

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn([]);

      // Act
      final result = await service.getCountries();

      // Assert
      expect(result, isEmpty);
    });

    test('uses correct endpoint', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries)).thenAnswer((_) async => mockResponse);
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(mockCountries);

      // Act
      await service.getCountries();

      // Assert
      verify(() => mockHttpService.get(Endpoints.africanCountries)).called(1);
    });
  });

  group('get country details', () {
    final mockCountryDetail = [
      {
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
      }
    ];

    test('successfully return CountryDetails', () async {
      //arrange
      when(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria"))
          .thenAnswer((_) async => mockResponse);
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(mockCountryDetail);
      // Act
      final result = await service.getCountryDetails('nigeria');
      // Assert
      expect(result, isA<CountryDetails>());
      expect(result.name?.common, 'Nigeria');
      expect(result.name?.official, 'Federal Republic of Nigeria');
      expect(result.capital, ['Abuja']);
      expect(result.altSpellings, ['NG', 'Nijeriya', 'Naíjíríà', 'Federal Republic of Nigeria']);
      expect(result.region, 'Africa');
      verify(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria")).called(1);
    });

    test('throws exception when response data is invalid', () async {
      // Arrange
      when(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria"))
          .thenAnswer((_) async => mockResponse);
      when(() => mockResponse.data).thenReturn({'invalid': 'data'});

      // Act & Assert
      expect(() => service.getCountryDetails('nigeria'), throwsA(isA<Exception>()));
    });

    test('throws exception when http call fails', () async {
      // Arrange
      when(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria"))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => service.getCountryDetails('nigeria'), throwsA(isA<Exception>()));
    });

    test('uses correct endpoint', () async {
      // Arrange
      when(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria"))
          .thenAnswer((_) async => mockResponse);
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(mockCountryDetail);

      // Act
      await service.getCountryDetails('nigeria');

      // Assert
      verify(() => mockHttpService.get("${Endpoints.africanCountryDetails}/nigeria")).called(1);
    });
  });
}
