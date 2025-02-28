import 'package:bloc_test/bloc_test.dart';
import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/african_flags_bloc/african_flags_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../constants.dart';

class MockAfricanFlagsRepository extends Mock implements AfricanFlagsRepository {}

void main() {
  late AfricanFlagsRepository mockRepository;
  final mockCountries = [mockEgypt, mockGhana];
  const mockFailure = CommonFailure('mock failure title', 'mock failure message');

  setUp(() {
    mockRepository = MockAfricanFlagsRepository();
  });

  group('AfricanFlagsBloc', () {
    test('initial state is AfricanFlagsInitial', () {
      expect(
        AfricanFlagsBloc(repository: mockRepository).state,
        isA<AfricanFlagsInitial>(),
      );
    });

    blocTest<AfricanFlagsBloc, AfricanFlagsState>(
      'emits [Loading, Loaded] when FetchAfricanFlags succeeds',
      build: () {
        when(() => mockRepository.getCountries()).thenAnswer((_) async => Right(mockCountries));
        return AfricanFlagsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(FetchAfricanFlags()),
      expect: () => [
        AfricanFlagsLoading(),
        AfricanFlagsLoaded(mockCountries),
      ],
      verify: (_) => verify(() => mockRepository.getCountries()).called(1),
    );

    blocTest<AfricanFlagsBloc, AfricanFlagsState>(
      'emits [Loading, Failure] when FetchAfricanFlags fails',
      build: () {
        when(() => mockRepository.getCountries()).thenAnswer((_) async => const Left(mockFailure));
        return AfricanFlagsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(FetchAfricanFlags()),
      expect: () => [
        AfricanFlagsLoading(),
        const AfricanFlagsFailure(mockFailure),
      ],
    );

    blocTest<AfricanFlagsBloc, AfricanFlagsState>(
      'emits [Loading, Loaded] when RefreshAfricanFlags succeeds',
      build: () {
        when(() => mockRepository.getCountries()).thenAnswer((_) async => Right(mockCountries));
        return AfricanFlagsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(RefreshAfricanFlags()),
      expect: () => [
        AfricanFlagsLoading(),
        AfricanFlagsLoaded(mockCountries),
      ],
      verify: (_) => verify(() => mockRepository.getCountries()).called(1),
    );

    blocTest<AfricanFlagsBloc, AfricanFlagsState>(
      'emits [Loading, Failure] when RefreshAfricanFlags fails',
      build: () {
        when(() => mockRepository.getCountries()).thenAnswer((_) async => const Left(mockFailure));
        return AfricanFlagsBloc(repository: mockRepository);
      },
      act: (bloc) => bloc.add(RefreshAfricanFlags()),
      expect: () => [
        AfricanFlagsLoading(),
        const AfricanFlagsFailure(mockFailure),
      ],
    );
  });
}
