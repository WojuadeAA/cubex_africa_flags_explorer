import 'package:equatable/equatable.dart';

class Demonym extends Equatable {
  final String f;
  final String m;

  const Demonym({required this.f, required this.m});

  factory Demonym.fromJson(Map<String, dynamic> json) {
    return Demonym(
      f: json['f'] as String,
      m: json['m'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'f': f,
      'm': m,
    };
  }

  @override
  List<Object?> get props => [f, m];
}
