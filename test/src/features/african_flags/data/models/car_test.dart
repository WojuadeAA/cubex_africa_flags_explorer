import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/car.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final carJson = {
    "signs": ["WAN"],
    "side": "right"
  };
  const car = Car(
    side: "right",
    signs: ["WAN"],
  );
  group('car model tests', () {
    test('fromJson creates correct Car instance', () {
      expect(Car.fromJson(carJson), equals(car));
    });
    test('toJson returns correct JSON map', () {
      expect(car.toJson(), equals(carJson));
    });
  });
}
