import 'package:equatable/equatable.dart';

class CountryFlags extends Equatable {
  final String png;
  final String svg;
  final String alt;

  const CountryFlags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory CountryFlags.fromJson(Map<String, dynamic> json) {
    return CountryFlags(
      png: json['png'] as String,
      svg: json['svg'] as String,
      alt: json['alt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }

  CountryFlags copyWith({
    String? png,
    String? svg,
    String? alt,
  }) {
    return CountryFlags(
      png: png ?? this.png,
      svg: svg ?? this.svg,
      alt: alt ?? this.alt,
    );
  }

  @override
  List<Object?> get props => [png, svg, alt];
}
