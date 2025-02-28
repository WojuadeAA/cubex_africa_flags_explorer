import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/maps.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mapJson = {
    "googleMaps": "https://goo.gl/maps/LTn417qWwBPFszuV9",
    "openStreetMaps": "https://www.openstreetmap.org/relation/192787"
  };
  const map = Maps(
    googleMaps: "https://goo.gl/maps/LTn417qWwBPFszuV9",
    openStreetMaps: "https://www.openstreetmap.org/relation/192787",
  );
  group('Maps model tests', () {
    test('fromJson creates correct Maps', () {
      expect(Maps.fromJson(mapJson), equals(map));
    });

    test('toJson returns correct Maps map ', () {
      expect(map.toJson(), equals(mapJson));
    });
  });
}
