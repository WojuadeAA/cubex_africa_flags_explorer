import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final List<String> signs;
  final String side;

  const Car({required this.signs, required this.side});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      signs: List<String>.from(json['signs'] as List),
      side: json['side'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'signs': signs,
      'side': side,
    };
  }

  @override
  List<Object?> get props => [signs, side];
}
