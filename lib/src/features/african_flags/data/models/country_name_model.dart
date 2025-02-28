import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';
import 'package:equatable/equatable.dart';

class CountryNameModel extends Equatable {
  final String common;
  final String official;
  final Map<String, CountryNativeName> nativeName;

  const CountryNameModel({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory CountryNameModel.fromJson(Map<String, dynamic> json) {
    return CountryNameModel(
      common: json['common'],
      official: json['official'],
      nativeName: Map.from(json["nativeName"]).map((k, v) =>
          MapEntry<String, CountryNativeName>(
              k, CountryNativeName.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'official': official,
      'nativeName': Map.from(nativeName)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
  }

  @override
  List<Object?> get props => [common, official, nativeName];
}
