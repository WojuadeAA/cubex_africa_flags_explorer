import 'package:equatable/equatable.dart';

class CapitalInfo extends Equatable {
  final List<double> latlng;

  const CapitalInfo({required this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic> json) {
    return CapitalInfo(
      latlng: List<double>.from(json['latlng']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'latlng': latlng,
    };
  }

  @override
  List<Object?> get props => [latlng];
}
