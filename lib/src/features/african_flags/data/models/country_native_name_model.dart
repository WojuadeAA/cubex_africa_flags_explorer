import 'package:equatable/equatable.dart';

class CountryNativeName extends Equatable {
  const CountryNativeName({
    required this.official,
    required this.common,
  });

  final String official;
  final String common;

  factory CountryNativeName.fromJson(Map<String, dynamic> json) {
    return CountryNativeName(
      official: json["official"] ?? "",
      common: json["common"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };

  @override
  String toString() {
    return "$official, $common, ";
  }

  CountryNativeName copyWith({
    String? official,
    String? common,
  }) {
    return CountryNativeName(
      official: official ?? this.official,
      common: common ?? this.common,
    );
  }

  @override
  List<Object?> get props => [official, common];
}
