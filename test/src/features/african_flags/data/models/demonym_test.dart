import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/demonym.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final demonymJson = {"f": "Nigerian", "m": "Nigerian"};
  const demonym = Demonym(
    f: "Nigerian",
    m: "Nigerian",
  );
  group('Demonym Tests', () {
    test('fromJson creates correct Demonym instance', () {
      expect(Demonym.fromJson(demonymJson), equals(demonym));
    });

    test('toJson returns correct JSON map', () {
      expect(demonym.toJson(), equals(demonymJson));
    });
  });
}
