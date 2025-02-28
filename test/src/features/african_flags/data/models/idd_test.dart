import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/idd.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final iddJson = {
    "root": "+2",
    "suffixes": ["34"]
  };
  const idd = Idd(
    root: "+2",
    suffixes: ["34"],
  );
  group('Idd  test', () {
    test('fromJson creates correct Idd instance', () {
      expect(Idd.fromJson(iddJson), equals(idd));
    });
    test('toJson returns correct JSON map', () {
      expect(idd.toJson(), equals(iddJson));
    });
  });
}
