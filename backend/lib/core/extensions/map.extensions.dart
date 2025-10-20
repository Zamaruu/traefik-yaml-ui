import 'dart:convert';

extension MapJsonExtension on Map<String, dynamic> {
  String get toJson => jsonEncode(this);
}
