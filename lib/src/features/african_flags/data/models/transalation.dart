import 'package:equatable/equatable.dart';

class Translation extends Equatable {
  final String official;
  final String common;

  const Translation({required this.official, required this.common});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json['official'] as String,
      common: json['common'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'official': official,
      'common': common,
    };
  }

  @override
  List<Object> get props => [official, common];
}
