import 'package:equatable/equatable.dart';

class Idd extends Equatable {
  final String root;
  final List<String> suffixes;

  const Idd({required this.root, required this.suffixes});

  factory Idd.fromJson(Map<String, dynamic> json) {
    return Idd(
      root: json['root'] as String,
      suffixes: List<String>.from(json['suffixes'] as List),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'root': root,
      'suffixes': suffixes,
    };
  }

  @override
  List<Object> get props => [root, suffixes];
}
