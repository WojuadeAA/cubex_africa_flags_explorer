import 'package:equatable/equatable.dart';

class PostalCode extends Equatable {
  final String format;
  final String regex;

  const PostalCode({required this.format, required this.regex});

  factory PostalCode.fromJson(Map<String, dynamic> json) {
    return PostalCode(
      format: json['format'],
      regex: json['regex'],
    );
  }
  Map<String, dynamic> toJson() => {
        'format': format,
        'regex': regex,
      };

  @override
  List<Object?> get props => [format, regex];
}
