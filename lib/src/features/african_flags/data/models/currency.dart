import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String name;
  final String symbol;

  const Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
    };
  }

  @override
  List<Object> get props => [name, symbol];
}
