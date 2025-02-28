import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/datasource/remote_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_details_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAfricanFlagsRemoteService extends Mock implements AfricanFlagsRemoteService {}

class MockCountry extends Mock implements Country {}

class MockCountryDetails extends Mock implements CountryDetails {}

void main() {
  late AfricanFlagsRepositoryImpl repository;
  late MockAfricanFlagsRemoteService mockRemoteService;

  setUp(() {
    mockRemoteService = MockAfricanFlagsRemoteService();
    repository = AfricanFlagsRepositoryImpl(remoteService: mockRemoteService);
  });

  group('getCountries', () {
    test('should return list of countries when remote call is successful', () async {
      // Arrange
      final countries = [MockCountry(), MockCountry()];
      when(() => mockRemoteService.getCountries()).thenAnswer((_) async => countries);

      // Act
      final result = await repository.getCountries();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (data) => expect(data, equals(countries)),
      );
      verify(() => mockRemoteService.getCountries()).called(1);
    });

    test('should return the exact number of country objects received from the service', () async {
      // Arrange
      final countries = List.generate(5, (_) => MockCountry());
      when(() => mockRemoteService.getCountries()).thenAnswer((_) async => countries);

      // Act
      final result = await repository.getCountries();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (data) => expect(data.length, equals(5)),
      );
    });
  });

  group('getCountryDetails', () {
    test("should return CountryDetails when remote call is successfull", () async {
      //Arrange
      const countryName = 'Nigeria';
      final countryDetails = MockCountryDetails();

      when(() => mockRemoteService.getCountryDetails(countryName)).thenAnswer((_) async => countryDetails);

      //Act
      final result = await repository.getCountryDetailsByName(countryName);

      //Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (data) => expect(data, equals(countryDetails)),
      );
      verify(() => mockRemoteService.getCountryDetails(countryName)).called(1);
    });
  });
}
