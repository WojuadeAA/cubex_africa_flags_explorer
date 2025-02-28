import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_flag_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_name_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_native_name_model.dart';

const mockGhana = Country(
  capital: ["Accra"],
  flags: CountryFlags(png: "png", svg: "svg", alt: "alt"),
  languages: {"English": "en"},
  name: CountryNameModel(
      common: "Ghana",
      official: "Republic of Ghana",
      nativeName: {"nativeName": CountryNativeName(official: "Ghana", common: "Ghana")}),
);

const mockKenya = Country(
  capital: ["Nairobi"],
  flags: CountryFlags(png: "png", svg: "svg", alt: "alt"),
  languages: {"Swahili": "sw", "English": "en"},
  name: CountryNameModel(
      common: "Kenya",
      official: "Republic of Kenya",
      nativeName: {"nativeName": CountryNativeName(official: "Kenya", common: "Kenya")}),
);

const mockEgypt = Country(
  capital: ["Cairo"],
  flags: CountryFlags(png: "png", svg: "svg", alt: "alt"),
  languages: {"Arabic": "ar"},
  name: CountryNameModel(
      common: "Egypt",
      official: "Arab Republic of Egypt",
      nativeName: {"nativeName": CountryNativeName(official: "Egypt", common: "Egypt")}),
);
