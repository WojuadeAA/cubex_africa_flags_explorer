import 'package:bloc_test/bloc_test.dart';
import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/country_details_bloc/country_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../constants.dart';

class MockAfricanFlagsRepository extends Mock implements AfricanFlagsRepository {}

void main() {
  late AfricanFlagsRepository mockRepository;
  const mockCountryDetail = countryDetails;

  const mockFailure = CommonFailure('mock failure title', 'mock failure message');

  setUp(() {
    mockRepository = MockAfricanFlagsRepository();
  });

  group("CountryDetailBloc", () {
    test('initial state is CountryDetailInitial', () {
      expect(
        CountryDetailsBloc(repository: mockRepository).state,
        isA<CountryDetailsInitial>(),
      );
    });
    blocTest<CountryDetailsBloc, CountryDetailsState>(
      'emits [Loading, Failure] when FetchCountryDetails Fail',
      build: () {
        when(() => mockRepository.getCountryDetailsByName('Egypt')).thenAnswer((_) async => const Left(mockFailure));
        return CountryDetailsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(const FetchCountryDetails(countryName: "Egypt")),
      expect: () => [
        CountryDetailsLoading(),
        const CountryDetailsFailure(mockFailure),
      ],
    );
    blocTest<CountryDetailsBloc, CountryDetailsState>(
      'emits [Loading, Loaded] when FetchCountryDetails Fail',
      build: () {
        when(() => mockRepository.getCountryDetailsByName('Nigeria'))
            .thenAnswer((_) async => const Right(mockCountryDetail));
        return CountryDetailsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(const FetchCountryDetails(countryName: "Nigeria")),
      expect: () => [
        CountryDetailsLoading(),
        const CountryDetailsLoaded(countryDetails: mockCountryDetail),
      ],
    );
  });
}
