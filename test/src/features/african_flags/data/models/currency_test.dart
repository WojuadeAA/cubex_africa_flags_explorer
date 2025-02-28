import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final currencyJson = {"name": "Nigerian naira", "symbol": "₦"};
  const currency = Currency(
    name: "Nigerian naira",
    symbol: "₦",
  );
  group('Currency Tests', () {
    test('fromJson creates correct Currency instance', () {
      expect(Currency.fromJson(currencyJson), equals(currency));
    });

    test('toJson returns correct JSON map', () {
      expect(currency.toJson(), equals(currencyJson));
    });
  });
}
