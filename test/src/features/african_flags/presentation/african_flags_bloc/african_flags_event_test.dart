import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/african_flags_bloc/african_flags_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AfricanFlagsEvent', () {
    group('FetchAfricanFlags', () {
      test('two instances should be equal', () {
        expect(FetchAfricanFlags(), equals(FetchAfricanFlags()));
      });

      test('props should be empty', () {
        expect(FetchAfricanFlags().props, isEmpty);
      });
    });

    group('RefreshAfricanFlags', () {
      test('two instances should be equal', () {
        expect(RefreshAfricanFlags(), equals(RefreshAfricanFlags()));
      });

      test('props should be empty', () {
        expect(RefreshAfricanFlags().props, isEmpty);
      });
    });

    test('different event types should not be equal', () {
      expect(FetchAfricanFlags(), isNot(equals(RefreshAfricanFlags())));
      expect(RefreshAfricanFlags(), isNot(equals(FetchAfricanFlags())));
    });
  });
}
