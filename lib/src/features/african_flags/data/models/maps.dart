import 'package:equatable/equatable.dart';

class Maps extends Equatable {
  final String googleMaps;
  final String openStreetMaps;

  const Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json['googleMaps'] as String,
      openStreetMaps: json['openStreetMaps'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }

  @override
  List<Object?> get props => [googleMaps, openStreetMaps];
}
