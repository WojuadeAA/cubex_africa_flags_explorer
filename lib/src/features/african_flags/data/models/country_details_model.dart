import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/capital_info.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/car.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/coat_of_arms.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/currency.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/demonym.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/idd.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/maps.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/postal_code.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/transalation.dart';
import 'package:equatable/equatable.dart';

class CountryDetails extends Equatable {
  final CountryNameModel name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, Currency> currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, String> languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final bool landlocked;
  final List<String> borders;
  final double area;
  final Map<String, Demonym> demonyms;
  final String flag;
  final Maps maps;
  final int population;
  final Map<String, double> gini;
  final String fifa;
  final Car car;
  final List<String> timezones;
  final List<String> continents;
  final CountryFlags flags;
  final CoatOfArms coatOfArms;
  final String startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  const CountryDetails({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CountryDetails.fromJson(Map<String, dynamic> json) {
    return CountryDetails(
      name: CountryNameModel.fromJson(json['name'] as Map<String, dynamic>),
      tld: (json['tld'] as List<dynamic>).map((e) => e as String).toList(),
      cca2: json['cca2'] as String,
      ccn3: json['ccn3'] as String,
      cca3: json['cca3'] as String,
      cioc: json['cioc'] as String,
      independent: json['independent'] as bool,
      status: json['status'] as String,
      unMember: json['unMember'] as bool,
      currencies: (json['currencies'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, Currency.fromJson(e as Map<String, dynamic>))),
      idd: Idd.fromJson(json['idd'] as Map<String, dynamic>),
      capital: (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      altSpellings: (json['altSpellings'] as List<dynamic>).map((e) => e as String).toList(),
      region: json['region'] as String,
      subregion: json['subregion'] as String,
      languages: Map<String, String>.from(json['languages'] as Map),
      translations: (json['translations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
      ),
      latlng: (json['latlng'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      landlocked: json['landlocked'] as bool,
      borders: (json['borders'] as List<dynamic>).map((e) => e as String).toList(),
      area: (json['area'] as num).toDouble(),
      demonyms: (json['demonyms'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Demonym.fromJson(e as Map<String, dynamic>)),
      ),
      flag: json['flag'] as String,
      maps: Maps.fromJson(json['maps'] as Map<String, dynamic>),
      population: (json['population'] as num).toInt(),
      gini: (json['gini'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      fifa: json['fifa'] as String,
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      timezones: (json['timezones'] as List<dynamic>).map((e) => e as String).toList(),
      continents: (json['continents'] as List<dynamic>).map((e) => e as String).toList(),
      flags: CountryFlags.fromJson(json['flags'] as Map<String, dynamic>),
      coatOfArms: CoatOfArms.fromJson(json['coatOfArms'] as Map<String, dynamic>),
      startOfWeek: json['startOfWeek'] as String,
      capitalInfo: CapitalInfo.fromJson(json['capitalInfo'] as Map<String, dynamic>),
      postalCode: PostalCode.fromJson(json['postalCode'] as Map<String, dynamic>),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name.toJson(),
      'tld': tld,
      'cca2': cca2,
      'ccn3': ccn3,
      'cca3': cca3,
      'cioc': cioc,
      'independent': independent,
      'status': status,
      'unMember': unMember,
      'currencies': currencies.map((k, e) => MapEntry(k, e.toJson())),
      'idd': idd.toJson(),
      'capital': capital,
      'altSpellings': altSpellings,
      'region': region,
      'subregion': subregion,
      'languages': languages,
      'translations': translations.map((k, e) => MapEntry(k, e.toJson())),
      'latlng': latlng,
      'landlocked': landlocked,
      'borders': borders,
      'area': area,
      'demonyms': demonyms.map((k, e) => MapEntry(k, e.toJson())),
      'flag': flag,
      'maps': maps.toJson(),
      'population': population,
      'gini': gini,
      'fifa': fifa,
      'car': car.toJson(),
      'timezones': timezones,
      'continents': continents,
      'flags': flags.toJson(),
      'coatOfArms': coatOfArms.toJson(),
      'startOfWeek': startOfWeek,
      'capitalInfo': capitalInfo.toJson(),
      'postalCode': postalCode.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        name,
        tld,
        cca2,
        ccn3,
        cca3,
        cioc,
        independent,
        status,
        unMember,
        currencies,
        idd,
        capital,
        altSpellings,
        region,
        subregion,
        languages,
        translations,
        latlng,
        landlocked,
        borders,
        area,
        demonyms,
        flag,
        maps,
        population,
        gini,
        fifa,
        car,
        timezones,
        continents,
        flags,
        coatOfArms,
        startOfWeek,
        capitalInfo,
        postalCode,
      ];
}
