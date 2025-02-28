// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final CountryFlags flags;
  final CountryNameModel name;
  final List<String> capital;
  final Map<String, String> languages;
  const Country({
    required this.flags,
    required this.name,
    required this.capital,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      flags: CountryFlags.fromJson(json['flags']),
      name: CountryNameModel.fromJson(json['name']),
      capital: List<String>.from(json['capital']),
      languages: Map<String, String>.from(json['languages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flags': flags.toJson(),
      'name': name.toJson(),
      'capital': capital,
      'languages': languages,
    };
  }

  @override
  List<Object?> get props => [flags, name, capital, languages];
}
