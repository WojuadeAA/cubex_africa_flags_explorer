import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/african_flags_bloc/african_flags_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../constants.dart';

void main() {
  group('AfricanFlagsState', () {
    group('AfricanFlagsInitial', () {
      test('two instances should be equal', () {
        expect(AfricanFlagsInitial(), AfricanFlagsInitial());
      });

      test('props should be empty', () {
        expect(AfricanFlagsInitial().props, isEmpty);
      });
    });

    group('AfricanFlagsLoading', () {
      test('two instances should be equal', () {
        expect(AfricanFlagsLoading(), AfricanFlagsLoading());
      });

      test('props should be empty', () {
        expect(AfricanFlagsLoading().props, isEmpty);
      });
    });

    group('AfricanFlagsLoaded', () {
      const countries = [mockEgypt, mockGhana];
      const differentCountries = [mockKenya];

      test('two instances with same countries should be equal', () {
        expect(const AfricanFlagsLoaded(countries), const AfricanFlagsLoaded(countries));
      });

      test('two instances with different countries should not be equal', () {
        expect(
          const AfricanFlagsLoaded(countries),
          isNot(equals(const AfricanFlagsLoaded(differentCountries))),
        );
      });

      test('props should contain countries', () {
        expect(const AfricanFlagsLoaded(countries).props, [countries]);
      });
    });

    group('AfricanFlagsFailure', () {
      const failure = CommonFailure("title", "message");
      const differentFailure = CommonFailure("different title", "different message");

      test('two instances with same failure should be equal', () {
        expect(const AfricanFlagsFailure(failure), const AfricanFlagsFailure(failure));
      });

      test('two instances with different failures should not be equal', () {
        expect(
          const AfricanFlagsFailure(failure),
          isNot(equals(const AfricanFlagsFailure(differentFailure))),
        );
      });

      test('props should contain failure', () {
        expect(const AfricanFlagsFailure(failure).props, [failure]);
      });
    });

    test('different state types should not be equal', () {
      expect(AfricanFlagsInitial(), isNot(equals(AfricanFlagsLoading())));
      expect(AfricanFlagsLoading(), isNot(equals(const AfricanFlagsLoaded([]))));
      expect(const AfricanFlagsLoaded([]), isNot(equals(const AfricanFlagsFailure(CommonFailure('title', 'message')))));
      expect(const AfricanFlagsFailure(CommonFailure('title', 'message')), isNot(equals(AfricanFlagsInitial())));
    });
  });
}
