import 'package:cubex_africa_flags_explorer/src/core/constants/endpoints.dart';
import 'package:cubex_africa_flags_explorer/src/core/network/network_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/datasource/remote_service.dart';
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
            "fra": {
              "official": "République centrafricaine",
              "common": "République centrafricaine"
            },
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
      when(() => mockHttpService.get(Endpoints.africanCountries))
          .thenAnswer((_) async => mockResponse);
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
      when(() => mockHttpService.get(Endpoints.africanCountries))
          .thenAnswer((_) async => mockResponse);
      when(() => mockResponse.data).thenReturn({'invalid': 'data'});

      // Act & Assert
      expect(() => service.getCountries(), throwsA(isA<Exception>()));
    });

    test('throws exception when http call fails', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries))
          .thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => service.getCountries(), throwsA(isA<Exception>()));
    });

    test('processes empty country list correctly', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries))
          .thenAnswer((_) async => mockResponse);

      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn([]);

      // Act
      final result = await service.getCountries();

      // Assert
      expect(result, isEmpty);
    });

    test('uses correct endpoint', () async {
      // Arrange
      when(() => mockHttpService.get(Endpoints.africanCountries))
          .thenAnswer((_) async => mockResponse);
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(mockCountries);

      // Act
      await service.getCountries();

      // Assert
      verify(() => mockHttpService.get(Endpoints.africanCountries)).called(1);
    });
  });
}
