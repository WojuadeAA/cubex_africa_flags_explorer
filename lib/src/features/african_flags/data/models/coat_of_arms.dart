import 'package:equatable/equatable.dart';

class CoatOfArms extends Equatable {
  final String png;
  final String svg;

  const CoatOfArms({required this.png, required this.svg});

  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(
      png: json['png'] as String,
      svg: json['svg'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'png': png,
      'svg': svg,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [png, svg];
}
